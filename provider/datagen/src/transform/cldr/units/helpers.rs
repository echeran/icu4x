// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/main/LICENSE ).

use core::ops::{Div, Mul};
use core::str::FromStr;
use std::collections::{BTreeMap, VecDeque};

use icu_experimental::unitsconversion::measureunit::MeasureUnitParser;
use icu_experimental::unitsconversion::provider::{ConversionInfo, Exactness, Sign};
use icu_provider::DataError;
use num_bigint::BigInt;
use num_rational::Ratio;
use zerovec::ZeroVec;

use crate::transform::cldr::cldr_serde::units::units_constants::Constant;

/// Represents a scientific number that contains only clean numerator and denominator terms.
/// NOTE:
///   clean means that there is no constant in the numerator or denominator.
///   For example, ["1.2"] is clean, but ["1.2", ft_to_m"] is not clean.
pub struct ScientificNumber {
    /// Contains numerator terms that are represented as scientific numbers
    pub clean_num: Vec<String>,
    /// Contains denominator terms that are represented as scientific numbers
    pub clean_den: Vec<String>,

    /// Indicates if the constant is exact or approximate
    pub exactness: Exactness,
}

/// Represents a general constant which contains scientific and non scientific numbers.
#[derive(Debug)]
struct GeneralNonScientificNumber {
    /// Contains numerator terms that are represented as scientific numbers
    clean_num: Vec<String>,
    /// Contains denominator terms that are represented as scientific numbers
    clean_den: Vec<String>,
    /// Contains numerator terms that are not represented as scientific numbers
    non_scientific_num: VecDeque<String>,
    /// Contains denominator terms that are not represented as scientific numbers
    non_scientific_den: VecDeque<String>,
    /// Indicates if the constant is exact or approximate
    exactness: Exactness,
}

impl GeneralNonScientificNumber {
    fn new(num: &[String], den: &[String], exactness: Exactness) -> Self {
        let mut constant = GeneralNonScientificNumber {
            clean_num: Vec::new(),
            clean_den: Vec::new(),
            non_scientific_num: VecDeque::new(),
            non_scientific_den: VecDeque::new(),
            exactness,
        };

        for n in num {
            if is_scientific_number(n) {
                constant.clean_num.push(n.clone());
            } else {
                constant.non_scientific_num.push_back(n.clone());
            }
        }

        for d in den {
            if is_scientific_number(d) {
                constant.clean_den.push(d.clone());
            } else {
                constant.non_scientific_den.push_back(d.clone());
            }
        }
        constant
    }

    /// Determines if the constant is free of any non_scientific elements.
    fn is_free_of_non_scientific(&self) -> bool {
        self.non_scientific_num.is_empty() && self.non_scientific_den.is_empty()
    }
}

pub fn process_factor_part(
    factor_part: &str,
    cons_map: &BTreeMap<&str, ScientificNumber>,
) -> Result<ScientificNumber, DataError> {
    if factor_part.contains('/') {
        return Err(DataError::custom("the factor part is fractional number"));
    }

    let mut result = ScientificNumber {
        clean_num: Vec::new(),
        clean_den: Vec::new(),
        exactness: Exactness::Exact,
    };

    let factor_parts = factor_part.split('*');
    for factor in factor_parts {
        if let Some(cons) = cons_map.get(factor.trim()) {
            result.clean_num.extend(cons.clean_num.clone());
            result.clean_den.extend(cons.clean_den.clone());
            if cons.exactness == Exactness::Approximate {
                result.exactness = Exactness::Approximate;
            }
        } else {
            result.clean_num.push(factor.trim().to_string());
        }
    }

    Ok(result)
}

/// Processes a factor in the form of a string and returns a ScientificNumber.
/// Examples:
///     "1" is converted to ScientificNumber { clean_num: ["1"], clean_den: ["1"], exactness: Exact }
///     "3 * ft_to_m" is converted to ScientificNumber { clean_num: ["3", "ft_to_m"], clean_den: ["1"], exactness: Exact }
/// NOTE:
///    If one of the constants in the factor is approximate, the whole factor is approximate.
pub fn process_factor(
    factor: &str,
    cons_map: &BTreeMap<&str, ScientificNumber>,
) -> Result<ScientificNumber, DataError> {
    let mut factor_parts = factor.split('/');
    let factor_num_str = factor_parts.next().unwrap_or("0").trim();
    let factor_den_str = factor_parts.next().unwrap_or("1").trim();
    if factor_parts.next().is_some() {
        return Err(DataError::custom(
            "the factor is not a valid scientific notation number",
        ));
    }

    let mut result = process_factor_part(factor_num_str, cons_map)?;
    let factor_den_scientific = process_factor_part(factor_den_str, cons_map)?;

    result.clean_num.extend(factor_den_scientific.clean_den);
    result.clean_den.extend(factor_den_scientific.clean_num);
    if factor_den_scientific.exactness == Exactness::Approximate {
        result.exactness = Exactness::Approximate;
    }

    Ok(result)
}

/// Converts a vector of strings to a vector of string slices.
fn to_str_vec(string_vec: &[String]) -> Vec<&str> {
    string_vec.iter().map(|s| s.as_str()).collect()
}

/// Extracts the conversion info from a base unit, factor and offset.
pub fn extract_conversion_info<'data>(
    base_unit: &str,
    factor: &ScientificNumber,
    offset: &ScientificNumber,
    parser: &MeasureUnitParser,
) -> Result<ConversionInfo<'data>, DataError> {
    let factor_fraction = convert_slices_to_fraction(
        &to_str_vec(&factor.clean_num),
        &to_str_vec(&factor.clean_den),
    )?;
    let offset_fraction = convert_slices_to_fraction(
        &to_str_vec(&offset.clean_num),
        &to_str_vec(&offset.clean_den),
    )?;

    let (factor_num, factor_den, factor_sign) = flatten_fraction(factor_fraction)?;
    let (offset_num, offset_den, offset_sign) = flatten_fraction(offset_fraction)?;

    let exactness = if factor.exactness == Exactness::Exact && offset.exactness == Exactness::Exact
    {
        Exactness::Exact
    } else {
        Exactness::Approximate
    };

    let base_unit = match parser.try_from_identifier(base_unit) {
        Ok(base_unit) => base_unit,
        Err(_) => return Err(DataError::custom("the base unit is not valid")),
    };

    Ok(ConversionInfo {
        basic_units: ZeroVec::from_iter(base_unit.contained_units),
        factor_num: factor_num.into(),
        factor_den: factor_den.into(),
        factor_sign,
        offset_num: offset_num.into(),
        offset_den: offset_den.into(),
        offset_sign,
        exactness,
    })
}

/// Processes the constants and return them in a numerator-denominator form.
pub fn process_constants<'a>(
    constants: &'a BTreeMap<String, Constant>,
) -> Result<BTreeMap<&'a str, ScientificNumber>, DataError> {
    let mut constants_with_non_scientific =
        VecDeque::<(&'a str, GeneralNonScientificNumber)>::new();
    let mut clean_constants_map = BTreeMap::<&str, GeneralNonScientificNumber>::new();
    for (cons_name, cons_value) in constants {
        let (num, den) = split_unit_term(&cons_value.value)?;
        let exactness = match cons_value.status.as_deref() {
            Some("approximate") => Exactness::Approximate,
            _ => Exactness::Exact,
        };
        let constant = GeneralNonScientificNumber::new(&num, &den, exactness);
        if constant.is_free_of_non_scientific() {
            clean_constants_map.insert(cons_name, constant);
        } else {
            constants_with_non_scientific.push_back((&cons_name, constant));
        }
    }
    let mut no_update_count = 0;
    while !constants_with_non_scientific.is_empty() {
        let mut updated = false;
        let (constant_key, mut non_scientific_constant) = constants_with_non_scientific
            .pop_front()
            .ok_or(DataError::custom(
                "non scientific queue error: an element must exist",
            ))?;
        for _ in 0..non_scientific_constant.non_scientific_num.len() {
            if let Some(num) = non_scientific_constant.non_scientific_num.pop_front() {
                if let Some(clean_constant) = clean_constants_map.get(num.as_str()) {
                    non_scientific_constant
                        .clean_num
                        .extend(clean_constant.clean_num.clone());
                    non_scientific_constant
                        .clean_den
                        .extend(clean_constant.clean_den.clone());
                    updated = true;
                } else {
                    non_scientific_constant.non_scientific_num.push_back(num);
                }
            }
        }
        for _ in 0..non_scientific_constant.non_scientific_den.len() {
            if let Some(den) = non_scientific_constant.non_scientific_den.pop_front() {
                if let Some(clean_constant) = clean_constants_map.get(den.as_str()) {
                    non_scientific_constant
                        .clean_num
                        .extend(clean_constant.clean_den.clone());
                    non_scientific_constant
                        .clean_den
                        .extend(clean_constant.clean_num.clone());
                    updated = true;
                } else {
                    non_scientific_constant.non_scientific_den.push_back(den);
                }
            }
        }
        if non_scientific_constant.is_free_of_non_scientific() {
            clean_constants_map.insert(constant_key, non_scientific_constant);
        } else {
            constants_with_non_scientific.push_back((constant_key, non_scientific_constant));
        }
        no_update_count = if !updated { no_update_count + 1 } else { 0 };
        if no_update_count > constants_with_non_scientific.len() {
            return Err(DataError::custom(
                "A loop was detected in the CLDR constants data!",
            ));
        }
    }

    Ok(clean_constants_map
        .into_iter()
        .map(|(k, v)| {
            (k, {
                ScientificNumber {
                    clean_num: v.clean_num,
                    clean_den: v.clean_den,
                    exactness: v.exactness,
                }
            })
        })
        .collect())
}

/// Converts a scientific notation number represented as a string to a fraction.
/// Examples:
/// - "1E2" is converted to 100/1
/// - "1E-2" is converted to 1/100
/// - "1.5E2" is converted to 150/1
/// - "1.5E-2" is converted to 15/1000
/// - " 1.5 E -2 " is converted to 15/1000
/// - " 1.5 E - 2" is an invalid scientific notation number
/// - "1.5E-2.5" is an invalid scientific notation number
pub fn convert_scientific_notation_to_fraction(number: &str) -> Result<Ratio<BigInt>, DataError> {
    let mut parts = number.split('E');
    let base = parts.next().unwrap_or("1").trim();
    let exponent = parts.next().unwrap_or("0").trim();
    if parts.next().is_some() {
        return Err(DataError::custom(
            "the number is not a valid scientific notation number",
        ));
    }

    let mut split = base.split('.');
    let base_whole = split.next().ok_or(DataError::custom("the base is empty"))?;
    let base_whole = if base_whole.is_empty() {
        BigInt::from(0)
    } else {
        BigInt::from_str(base_whole).map_err(|_| {
            DataError::custom("the whole part of the base is not a valid whole number")
        })?
    };

    let base_dec = if let Some(dec_str) = split.next() {
        let dec = BigInt::from_str(dec_str).map_err(|_| {
            DataError::custom("the decimal part of the base is not a valid whole number")
        })?;
        let exp = dec_str.chars().filter(char::is_ascii_digit).count();
        Ratio::new(dec, BigInt::from(10u32).pow(exp as u32))
    } else {
        Ratio::new(BigInt::from(0), BigInt::from(1))
    };

    let base = base_dec + base_whole;

    let exponent = i32::from_str(exponent)
        .map_err(|_| DataError::custom("the exponent is not a valid integer"))?;

    let result = if exponent >= 0 {
        base.mul(Ratio::new(
            BigInt::from(10u32).pow(exponent as u32),
            BigInt::from(1u32),
        ))
    } else {
        base.div(Ratio::new(
            BigInt::from(10u32).pow((-exponent) as u32),
            BigInt::from(1u32),
        ))
    };
    Ok(result)
}

// TODO: move this to the comment above.
#[test]
fn test_convert_scientific_notation_to_fraction() {
    let input = "1E2";
    let expected = Ratio::<BigInt>::new(BigInt::from(100u32), BigInt::from(1u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1E-2";
    let expected = Ratio::<BigInt>::new(BigInt::from(1u32), BigInt::from(100u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1.5E2";
    let expected = Ratio::<BigInt>::new(BigInt::from(150u32), BigInt::from(1u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1.5E-2";
    let expected = Ratio::<BigInt>::new(BigInt::from(15u32), BigInt::from(1000u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);

    let input = " 1.5 E -2 ";
    let expected = Ratio::<BigInt>::new(BigInt::from(15u32), BigInt::from(1000u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);

    let input = " 1.5 E - 2";
    let actual = convert_scientific_notation_to_fraction(input);
    assert!(actual.is_err());

    let input = "1.5E-2.5";
    let actual = convert_scientific_notation_to_fraction(input);
    assert!(actual.is_err());

    let input = "0.308";
    let expected = Ratio::<BigInt>::new(BigInt::from(308), BigInt::from(1000u32));
    let actual = convert_scientific_notation_to_fraction(input).unwrap();
    assert_eq!(expected, actual);
}

/// Determines if a string contains any alphabetic characters.
/// Returns true if the string contains at least one alphabetic character, false otherwise.
/// Examples:
/// - "1" returns false
/// - "ft_to_m" returns true
/// - "1E2" returns true
/// - "1.5E-2" returns true
pub fn contains_alphabetic_chars(s: &str) -> bool {
    s.chars().any(char::is_alphabetic)
}

#[test]
fn test_contains_alphabetic_chars() {
    let input = "1";
    let expected = false;
    let actual = contains_alphabetic_chars(input);
    assert_eq!(expected, actual);

    let input = "ft_to_m";
    let expected = true;
    let actual = contains_alphabetic_chars(input);
    assert_eq!(expected, actual);

    let input = "1E2";
    let expected = true;
    let actual = contains_alphabetic_chars(input);
    assert_eq!(expected, actual);

    let input = "1.5E-2";
    let expected = true;
    let actual = contains_alphabetic_chars(input);
    assert_eq!(expected, actual);
}

/// Checks if a string is a valid scientific notation number.
/// Returns true if the string is a valid scientific notation number, false otherwise.  
pub fn is_scientific_number(s: &str) -> bool {
    let mut parts = s.split('E');
    let base = parts.next().unwrap_or("0");
    let exponent = parts.next().unwrap_or("0");
    if parts.next().is_some() {
        return false;
    }

    !contains_alphabetic_chars(base) && !contains_alphabetic_chars(exponent)
}

/// Transforms a fractional number into byte numerators, byte denominators, and a sign.
pub fn flatten_fraction(fraction: Ratio<BigInt>) -> Result<(Vec<u8>, Vec<u8>, Sign), DataError> {
    let (n_sign, numer) = fraction.numer().to_bytes_le();
    let (d_sign, denom) = fraction.denom().to_bytes_le();

    // Ratio's constructor sets denom > 0 but it's worth
    // checking in case we decide to switch to new_raw() to avoid reducing
    let sign = if n_sign * d_sign == num_bigint::Sign::Minus {
        Sign::Negative
    } else {
        Sign::Positive
    };

    Ok((numer, denom, sign))
}

/// Converts slices of numerator and denominator strings to a fraction.
/// Examples:
/// - ["1"], ["2"] is converted to 1/2
/// - ["1", "2"], ["3", "1E2"] is converted to 1*2/(3*1E2) --> 2/300
/// - ["1", "2"], ["3", "1E-2"] is converted to 1*2/(3*1E-2) --> 200/3
/// - ["1", "2"], ["3", "1E-2.5"] is an invalid scientific notation number
/// - ["1E2"], ["2"] is converted to 1E2/2 --> 100/2 --> 50/1
/// - ["1E2", "2"], ["3", "1E2"] is converted to 1E2*2/(3*1E2) --> 2/3
pub fn convert_slices_to_fraction(
    numerator_strings: &[&str],
    denominator_strings: &[&str],
) -> Result<Ratio<BigInt>, DataError> {
    let mut fraction = Ratio::new(BigInt::from(1u32), BigInt::from(1u32));

    for numerator in numerator_strings {
        let num_fraction = convert_scientific_notation_to_fraction(numerator)?;
        fraction *= num_fraction;
    }

    for denominator in denominator_strings {
        let den_fraction = convert_scientific_notation_to_fraction(denominator)?;
        fraction /= den_fraction;
    }

    Ok(fraction)
}

// TODO: move some of these tests to the comment above.
#[test]
fn test_convert_array_of_strings_to_fraction() {
    let numerator: Vec<&str> = vec!["1"];
    let denominator: Vec<&str> = vec!["2"];
    let expected = Ratio::new(BigInt::from(1i32), BigInt::from(2i32));
    let actual = convert_slices_to_fraction(&numerator, &denominator).unwrap();
    assert_eq!(expected, actual);

    let numerator = vec!["1", "2"];
    let denominator = vec!["3", "1E2"];
    let expected = Ratio::new(BigInt::from(2i32), BigInt::from(300i32));
    let actual = convert_slices_to_fraction(&numerator, &denominator).unwrap();
    assert_eq!(expected, actual);

    let numerator = vec!["1", "2"];
    let denominator = vec!["3", "1E-2"];
    let expected = Ratio::new(BigInt::from(200i32), BigInt::from(3i32));
    let actual = convert_slices_to_fraction(&numerator, &denominator).unwrap();
    assert_eq!(expected, actual);

    let numerator = vec!["1", "2"];
    let denominator = vec!["3", "1E-2.5"];
    let actual = convert_slices_to_fraction(&numerator, &denominator);
    assert!(actual.is_err());

    let numerator = vec!["1E2"];
    let denominator = vec!["2"];
    let expected = Ratio::new(BigInt::from(50i32), BigInt::from(1i32));
    let actual = convert_slices_to_fraction(&numerator, &denominator).unwrap();
    assert_eq!(expected, actual);

    let numerator = vec!["1E2", "2"];
    let denominator = vec!["3", "1E2"];
    let expected = Ratio::new(BigInt::from(2i32), BigInt::from(3i32));
    let actual = convert_slices_to_fraction(&numerator, &denominator).unwrap();
    assert_eq!(expected, actual);
}

/// Splits a constant string into a tuple of (numerator, denominator).
/// The numerator and denominator are represented as arrays of strings.
/// Examples:
/// - "1/2" is split into (["1"], ["2"])
/// - "1 * 2 / 3 * ft_to_m" is split into (["1", "2"], ["3" , "ft_to_m"])
/// - "/2" is split into (["1"], ["2"])
/// - "2" is split into (["2"], ["1"])
/// - "2/" is split into (["2"], ["1"])
/// - "1E2" is split into (["1E2"], ["1"])
/// - "1 2 * 3" is an invalid constant string
pub fn split_unit_term(constant_string: &str) -> Result<(Vec<String>, Vec<String>), DataError> {
    let split: Vec<&str> = constant_string.split('/').collect();
    if split.len() > 2 {
        return Err(DataError::custom("Invalid constant string"));
    }

    // Define a closure to process each part of the split string
    let process_string = |s: &str| -> Vec<String> {
        if s.is_empty() {
            vec!["1".to_string()]
        } else {
            s.split('*').map(|s| s.trim().to_string()).collect()
        }
    };

    // Process the numerator and denominator parts
    let numerator_values = process_string(split.first().unwrap_or(&"1"));
    let denominator_values = process_string(split.get(1).unwrap_or(&"1"));

    // If any part contains internal white spaces, return an error
    if numerator_values
        .iter()
        .any(|s| s.chars().any(char::is_whitespace))
        || denominator_values
            .iter()
            .any(|s| s.chars().any(char::is_whitespace))
    {
        return Err(DataError::custom(
            "The constant string contains internal white spaces",
        ));
    }

    Ok((numerator_values, denominator_values))
}
// TODO: move this to the comment above.
#[test]
fn test_convert_constant_to_num_denom_strings() {
    let input = "1/2";
    let expected = (vec!["1".to_string()], vec!["2".to_string()]);
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1 * 2 / 3 * ft_to_m";
    let expected = (
        vec!["1".to_string(), "2".to_string()],
        vec!["3".to_string(), "ft_to_m".to_string()],
    );
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "/2";
    let expected = (vec!["1".to_string()], vec!["2".to_string()]);
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "2";
    let expected = (vec!["2".to_string()], vec!["1".to_string()]);
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "2/";
    let expected = (vec!["2".to_string()], vec!["1".to_string()]);
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1E2";
    let expected = (vec!["1E2".to_string()], vec!["1".to_string()]);
    let actual = split_unit_term(input).unwrap();
    assert_eq!(expected, actual);

    let input = "1 2 * 3";
    let actual = split_unit_term(input);
    assert!(actual.is_err());
}
