// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/main/LICENSE ).

use diplomat_core::*;
use rustdoc_types::{Crate, Item, ItemEnum};
use std::collections::{BTreeSet, HashSet};
use std::fmt;
use std::fs::{self, File};
use std::path::PathBuf;
mod allowlist;
use allowlist::{IGNORED_ASSOCIATED_ITEMS, IGNORED_PATHS, IGNORED_SUBSTRINGS, IGNORED_TRAITS};

static FILE_HEADER: &str = r##"# This file contains all APIs that are exposed in Rust but not over FFI, and not allowlisted in IGNORED_PATHS in tools/ffi_coverage/allowlist.rs.
# It is generated by `cargo make diplomat-coverage`.
#
# If adding an API that expands this file, please consider:
#
#  - Whether you can expose that API over FFI in the same PR (and if you do so, be sure to add a `rust_link` annotation)
#  - Whether the API already has its functionality exposed over FFI (if so, add a potentially-`hidden` `rust_link` annotation to the corresponding FFI API)
#  - Whether that API is rust-specific functionality that need not be exposed (if so, add it to the allowlist with a note, or add a `hidden` `rust_link` annotation to a related API if possible)
#  - Whether that API should be punted for later in FFI (if so, please check in with @Manishearth, @robertbastian, or @sffc)
#  - Whether the API is experimental (if so, add it to the allowlist as experimental)
#
# It is acceptable to temporarily have APIs in this file that you plan to add in a soon-upcoming PR.
#
# Please check in with @Manishearth, @robertbastian, or @sffc if you have questions

"##;
/// RustLink but without display information
#[derive(PartialEq, Eq, Debug, Clone, PartialOrd, Ord, Hash)]
struct RustLinkInfo {
    path: ast::Path,
    typ: ast::DocType,
}

impl fmt::Display for RustLinkInfo {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}#{:?}", self.path, self.typ)
    }
}

fn main() {
    let out_path = std::env::args().nth(1);
    let doc_types = ["icu", "fixed_decimal", "icu_provider_adapters"]
        .into_iter()
        .flat_map(collect_public_types)
        .map(|(path_vec, typ)| {
            let mut path = ast::Path::empty();
            path.elements = path_vec.into_iter().map(ast::Ident::from).collect();
            RustLinkInfo { path, typ }
        })
        .filter(|rl| {
            ![
                ast::DocType::EnumVariant,
                ast::DocType::Mod,
                ast::DocType::Trait,
            ]
            .contains(&rl.typ)
        })
        .collect::<BTreeSet<_>>();

    let capi_crate = PathBuf::from(concat!(
        std::env!("CARGO_MANIFEST_DIR"),
        "/../../../ffi/capi/src/lib.rs"
    ));
    eprintln!("Loading icu_capi crate from {capi_crate:?}");
    let capi_types = ast::File::from(&syn_inline_mod::parse_and_inline_modules(&capi_crate))
        .all_rust_links()
        .into_iter()
        .cloned()
        .map(|rl| RustLinkInfo {
            path: rl.path,
            typ: rl.typ,
        })
        .collect::<BTreeSet<_>>();

    let mut file_anchor = None;
    let mut stdout_anchor = None;
    let out_stream = if let Some(out_path) = out_path {
        let stream = file_anchor.insert(File::create(out_path).expect("opening output file"));
        stream as &mut dyn std::io::Write
    } else {
        let stream = stdout_anchor.insert(std::io::stdout());
        stream as &mut dyn std::io::Write
    };
    writeln!(out_stream, "{FILE_HEADER}").unwrap();
    doc_types
        .difference(&capi_types)
        .for_each(|item| writeln!(out_stream, "{item}").unwrap());
}

fn collect_public_types(krate: &str) -> impl Iterator<Item = (Vec<String>, ast::DocType)> {
    fn parse_doc(krate: &str) -> &Crate {
        lazy_static::lazy_static! {
            static ref CRATES: elsa::sync::FrozenMap<String, Box<Crate>> = elsa::sync::FrozenMap::new();
        }

        if CRATES.get(krate).is_none() {
            eprintln!("Parsing crate {krate}");
            std::process::Command::new("rustup")
                .args(["install", "nightly-2023-08-08"])
                .output()
                .expect("failed to install nightly");
            let output = std::process::Command::new("rustup")
                .args([
                    "run",
                    "nightly-2023-08-08",
                    "cargo",
                    "rustdoc",
                    "-Zsparse-registry",
                    "-p",
                    krate,
                    "--all-features",
                    "--",
                    "-Zunstable-options",
                    "--output-format",
                    "json",
                ])
                .output()
                .expect("failed to execute rustdoc");
            if !output.status.success() {
                panic!("Rustdoc build failed with {output:?}");
            }
            let path = PathBuf::from(std::env!("CARGO_MANIFEST_DIR"))
                .join("../../../target/doc")
                .join(krate)
                .with_extension("json");
            eprintln!("Attempting to load {path:?}");
            CRATES.insert(
                krate.to_owned(),
                serde_json::from_slice(&fs::read(&path).unwrap()).unwrap(),
            );
        }
        CRATES.get(krate).unwrap()
    }

    #[derive(Debug)]
    enum In<'a> {
        Trait,
        // The Option<String> is for the trait name of an impl
        Enum(Option<&'a str>),
        Struct(Option<&'a str>),
    }

    fn recurse(
        item: &Item,
        krate: &Crate,
        types: &mut HashSet<(Vec<String>, ast::DocType)>,
        mut path: Vec<String>,
        path_already_extended: bool,
        inside: Option<In>,
    ) {
        fn ignored(path: &Vec<String>) -> bool {
            IGNORED_PATHS.contains(path)
                || path
                    .last()
                    .map(|l| IGNORED_SUBSTRINGS.iter().any(|i| l.contains(i)))
                    .unwrap_or(false)
        }
        /// Helper function that ensures that ignored()
        /// is respected for every type inserted
        ///
        /// (We have a check at the beginning of recurse() but that won't catch leaf nodes)
        fn insert_ty(
            types: &mut HashSet<(Vec<String>, ast::DocType)>,
            path: Vec<String>,
            ty: ast::DocType,
        ) {
            if !ignored(&path) {
                types.insert((path, ty));
            }
        }

        fn check_ignored_assoc_item(name: &str, trait_path: Option<&str>) -> bool {
            if let Some(tr) = trait_path {
                if let Some(ignored) = IGNORED_ASSOCIATED_ITEMS.get(tr) {
                    if ignored.contains(&name) {
                        return true;
                    }
                }
            }
            false
        }

        if ignored(&path) {
            return;
        }
        match &item.inner {
            ItemEnum::Import(import) => {
                if !import.glob {
                    path.push(import.name.clone());
                }

                if let Some(item) = &krate.index.get(import.id.as_ref().unwrap()) {
                    recurse(item, krate, types, path, true, None);
                } else if let Some(item) = &krate.paths.get(import.id.as_ref().unwrap()) {
                    // This is a reexport of hidden items, which work fine in HTML doc but
                    // don't seem to be reachable anywhere in JSON.
                    if let Some(item) = import
                        .source
                        .as_str()
                        .strip_prefix("icu_provider::fallback::")
                    {
                        insert_ty(
                            types,
                            vec![
                                "icu".to_string(),
                                "locale".to_string(),
                                "fallback".to_string(),
                                item.to_string(),
                            ],
                            match item {
                                "LocaleFallbackPriority" | "LocaleFallbackSupplement" => {
                                    ast::DocType::Enum
                                }
                                "LocaleFallbackConfig" => ast::DocType::Struct,
                                e => unreachable!("{e:?}"),
                            },
                        );
                        return;
                    }

                    // External crate. This is quite complicated and while it works, I'm not sure
                    // it's correct. This basically handles the case `pub use other_crate::module::Struct`,
                    // which means we have to parse `other_crate`, then look for `module`, then look
                    // for `Struct`. Now, `module` could actually be a reexport, which is why we have to
                    // check the `Import` case when traversing the path.
                    let external_crate = parse_doc(&krate.external_crates[&item.crate_id].name);
                    let mut item = &external_crate.index[&external_crate.root];
                    for segment in import.source.split("::").skip(1) {
                        match &item.inner {
                            ItemEnum::Module(inner) => {
                                item = inner
                                    .items
                                    .iter()
                                    .map(|id| &external_crate.index[id])
                                    .find(|item| match &item.inner {
                                        ItemEnum::Import(import) => {
                                            if import.name.as_str() == segment {
                                                path.pop();
                                                true
                                            } else {
                                                false
                                            }
                                        }
                                        _ => item.name.as_deref() == Some(segment),
                                    })
                                    .expect(&import.source);
                            }
                            _ => unreachable!(),
                        }
                    }
                    recurse(item, external_crate, types, path, true, None);
                } else {
                    eprintln!("{path:?} should be in either index or paths");
                }
            }
            _ => {
                let item_name = item.name.as_ref().unwrap();
                if !path_already_extended {
                    path.push(item_name.clone());
                }
                match &item.inner {
                    ItemEnum::Module(module) => {
                        for id in &module.items {
                            recurse(&krate.index[id], krate, types, path.clone(), false, None);
                        }
                        insert_ty(types, path, ast::DocType::Mod);
                    }
                    ItemEnum::Struct(structt) => {
                        for id in &structt.impls {
                            if let ItemEnum::Impl(inner) = &krate.index[id].inner {
                                let mut trait_name = None;
                                if let Some(path) = &inner.trait_ {
                                    let name = &path.name;
                                    if IGNORED_TRAITS.contains(name.as_str()) {
                                        continue;
                                    }
                                    trait_name = Some(&*path.name);
                                }
                                for id in &inner.items {
                                    recurse(
                                        &krate.index[id],
                                        krate,
                                        types,
                                        path.clone(),
                                        false,
                                        Some(In::Struct(trait_name)),
                                    );
                                }
                            }
                        }

                        insert_ty(types, path, ast::DocType::Struct);
                    }
                    ItemEnum::Enum(enumm) => {
                        for id in &enumm.variants {
                            recurse(&krate.index[id], krate, types, path.clone(), false, None);
                        }

                        for id in &enumm.impls {
                            if let ItemEnum::Impl(inner) = &krate.index[id].inner {
                                let mut trait_name = None;
                                if let Some(path) = &inner.trait_ {
                                    let name = &path.name;
                                    if IGNORED_TRAITS.contains(name.as_str()) {
                                        continue;
                                    }
                                    trait_name = Some(&*path.name);
                                }
                                for id in &inner.items {
                                    recurse(
                                        &krate.index[id],
                                        krate,
                                        types,
                                        path.clone(),
                                        false,
                                        Some(In::Enum(trait_name)),
                                    );
                                }
                            }
                        }

                        insert_ty(types, path, ast::DocType::Enum);
                    }
                    ItemEnum::Trait(inner) => {
                        for id in &inner.items {
                            recurse(
                                &krate.index[id],
                                krate,
                                types,
                                path.clone(),
                                false,
                                Some(In::Trait),
                            );
                        }
                        insert_ty(types, path, ast::DocType::Trait);
                    }
                    ItemEnum::Constant(_) => {
                        insert_ty(types, path, ast::DocType::Constant);
                    }
                    ItemEnum::Function(_) => {
                        let doc_type = match inside {
                            Some(In::Enum(tr)) | Some(In::Struct(tr))
                                if check_ignored_assoc_item(item_name, tr) =>
                            {
                                return
                            }
                            Some(In::Enum(_)) => ast::DocType::FnInEnum,
                            Some(In::Trait) => ast::DocType::FnInTrait,
                            Some(In::Struct(_)) => ast::DocType::FnInStruct,
                            _ => ast::DocType::Fn,
                        };
                        insert_ty(types, path, doc_type);
                    }
                    ItemEnum::Macro(_) => {
                        insert_ty(types, path, ast::DocType::Macro);
                    }
                    ItemEnum::Typedef(_) => {
                        insert_ty(types, path, ast::DocType::Typedef);
                    }
                    ItemEnum::Variant(_) => {
                        insert_ty(types, path, ast::DocType::EnumVariant);
                    }
                    ItemEnum::AssocConst { .. } => {
                        let doc_type = match inside {
                            Some(In::Enum(tr)) | Some(In::Struct(tr))
                                if check_ignored_assoc_item(item_name, tr) =>
                            {
                                return
                            }
                            Some(In::Enum(_)) => ast::DocType::AssociatedConstantInEnum,
                            Some(In::Trait) => ast::DocType::AssociatedConstantInTrait,
                            Some(In::Struct(_)) => ast::DocType::AssociatedConstantInStruct,
                            _ => panic!("AssocConst needs In"),
                        };
                        insert_ty(types, path, doc_type);
                    }
                    ItemEnum::AssocType { .. } => {
                        let doc_type = match inside {
                            Some(In::Enum(tr)) | Some(In::Struct(tr))
                                if check_ignored_assoc_item(item_name, tr) =>
                            {
                                return
                            }
                            Some(In::Enum(_)) => ast::DocType::AssociatedTypeInEnum,
                            Some(In::Trait) => ast::DocType::AssociatedTypeInTrait,
                            Some(In::Struct(_)) => ast::DocType::AssociatedTypeInStruct,
                            _ => panic!("AssocType needs In"),
                        };
                        insert_ty(types, path, doc_type);
                    }
                    ItemEnum::ProcMacro(..) => {}
                    _ => todo!("{:?}", item),
                }
            }
        }
    }

    let mut types = HashSet::new();
    let krate = parse_doc(krate);

    recurse(
        &krate.index[&krate.root],
        krate,
        &mut types,
        Vec::new(),
        false,
        None,
    );

    types.into_iter()
}
