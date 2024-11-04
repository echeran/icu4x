// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/main/LICENSE ).

#include <icu4x/GregorianDateFormatter.hpp>
#include <icu4x/GregorianDateTimeFormatter.hpp>
#include <icu4x/DateTimeFormatter.hpp>
#include <icu4x/TimeFormatter.hpp>
#include <icu4x/Logger.hpp>
#include <icu4x/TimeZoneInfo.hpp>
#include <icu4x/TimeZoneIdMapper.hpp>
#include <icu4x/TimeZoneIdMapperWithFastCanonicalization.hpp>
#include <icu4x/GregorianZonedDateTimeFormatter.hpp>
#include <icu4x/ZonedDateTimeFormatter.hpp>

#include <atomic>
#include <iostream>
#include <array>

using namespace icu4x;

int main() {
    Logger::init_simple_logger();
    std::unique_ptr<Locale> locale = Locale::from_string("es").ok().value();
    std::cout << "Running test for locale " << locale->to_string() << std::endl;
    std::unique_ptr<DataProvider> dp = DataProvider::compiled();

    std::unique_ptr<IsoDateTime> date = IsoDateTime::create(2022, 07, 11, 13, 06, 42, 0).ok().value();

    std::unique_ptr<TimeFormatter> tf = TimeFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Short).ok().value();
    std::string out = tf->format_iso_datetime(*date.get());
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "13:06") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    std::unique_ptr<GregorianDateFormatter> df = GregorianDateFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Long).ok().value();
    out = df->format_iso_datetime(*date.get());
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "11 de julio de 2022") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    std::unique_ptr<GregorianDateTimeFormatter> dtf = GregorianDateTimeFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Medium).ok().value();
    out = dtf->format_iso_datetime(*date.get());
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "11 jul 2022, 13:06") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    locale = Locale::from_string("en-u-ca-japanese").ok().value();
    std::unique_ptr<Calendar> cal = Calendar::create_for_locale(*dp.get(), *locale.get()).ok().value();
    std::unique_ptr<DateTime> any_date = DateTime::from_iso_in_calendar(2020, 10, 5, 13, 33, 15, 0, *cal.get()).ok().value();
    std::unique_ptr<DateTimeFormatter> any_dtf = DateTimeFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Medium).ok().value();
    out = any_dtf->format_datetime(*any_date.get()).ok().value();
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "Oct 5, 2 Reiwa, 1:33\u202fPM") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    std::unique_ptr<TimeZoneIdMapper> mapper = TimeZoneIdMapper::create(*dp.get()).ok().value();
    std::string normalized_iana_id = mapper->normalize_iana("America/CHICAGO").ok().value().value();
    if (normalized_iana_id != "America/Chicago") {
        std::cout << "Time zone ID does not normalize: " << normalized_iana_id << std::endl;
        return 1;
    }
    std::string canonicalied_iana_id = mapper->canonicalize_iana("Asia/Calcutta").ok().value().value();
    if (canonicalied_iana_id != "Asia/Kolkata") {
        std::cout << "Time zone ID does not canonicalize: " << canonicalied_iana_id << std::endl;
        return 1;
    }
    std::string slow_recovered_iana_id = mapper->find_canonical_iana_from_bcp47("uschi").value();
    if (slow_recovered_iana_id != "America/Chicago") {
        std::cout << "Time zone ID does not roundtrip (slow): " << slow_recovered_iana_id << std::endl;
        return 1;
    }
    std::unique_ptr<TimeZoneIdMapperWithFastCanonicalization> reverse_mapper = TimeZoneIdMapperWithFastCanonicalization::create(*dp.get()).ok().value();
    std::string fast_recovered_iana_id = reverse_mapper->canonical_iana_from_bcp47("uschi").value();
    if (fast_recovered_iana_id != "America/Chicago") {
        std::cout << "Time zone ID does not roundtrip (fast): " << fast_recovered_iana_id << std::endl;
        return 1;
    }

    std::unique_ptr<TimeZoneInfo> time_zone = TimeZoneInfo::unknown();
    time_zone->try_set_offset_str("-05:00").ok().value();
    int32_t offset = time_zone->offset_seconds().value();
    if (offset != -18000) {
        std::cout << "GMT offset doesn't parse" << std::endl;
        return 1;
    }
    time_zone->set_iana_time_zone_id(*mapper.get(), "america/chicago");
    std::string time_zone_id_return = time_zone->time_zone_id();
    if (time_zone_id_return != "uschi") {
        std::cout << "Time zone ID does not roundtrip: " << time_zone_id_return << std::endl;
        return 1;
    }
    time_zone->set_local_time(*date.get());
    time_zone->set_daylight_time();

    std::unique_ptr<GregorianZonedDateTimeFormatter> gzdtf = GregorianZonedDateTimeFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Long).ok().value();
    out = gzdtf->format_iso_datetime_with_custom_time_zone(*date.get(), *time_zone.get()).ok().value();
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "July 11, 2022, 1:06:42\u202fPM CT") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    time_zone->set_local_time(*any_date->to_iso().get());

    std::unique_ptr<ZonedDateTimeFormatter> zdtf = ZonedDateTimeFormatter::create_with_length(*dp.get(), *locale.get(), DateTimeLength::Long).ok().value();
    out = zdtf->format_datetime_with_custom_time_zone(*any_date.get(), *time_zone.get()).ok().value();
    std::cout << "Formatted value is " << out << std::endl;
    if (out != "October 5, 2 Reiwa, 1:33:15\u202fPM CT") {
        std::cout << "Output does not match expected output" << std::endl;
        return 1;
    }

    return 0;
}
