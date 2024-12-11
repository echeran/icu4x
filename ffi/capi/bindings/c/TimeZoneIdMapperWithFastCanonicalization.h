#ifndef TimeZoneIdMapperWithFastCanonicalization_H
#define TimeZoneIdMapperWithFastCanonicalization_H

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "diplomat_runtime.h"

#include "DataError.d.h"
#include "DataProvider.d.h"

#include "TimeZoneIdMapperWithFastCanonicalization.d.h"






TimeZoneIdMapperWithFastCanonicalization* icu4x_TimeZoneIdMapperWithFastCanonicalization_create_mv1(void);

typedef struct icu4x_TimeZoneIdMapperWithFastCanonicalization_create_with_provider_mv1_result {union {TimeZoneIdMapperWithFastCanonicalization* ok; DataError err;}; bool is_ok;} icu4x_TimeZoneIdMapperWithFastCanonicalization_create_with_provider_mv1_result;
icu4x_TimeZoneIdMapperWithFastCanonicalization_create_with_provider_mv1_result icu4x_TimeZoneIdMapperWithFastCanonicalization_create_with_provider_mv1(const DataProvider* provider);

typedef struct icu4x_TimeZoneIdMapperWithFastCanonicalization_canonicalize_iana_mv1_result { bool is_ok;} icu4x_TimeZoneIdMapperWithFastCanonicalization_canonicalize_iana_mv1_result;
icu4x_TimeZoneIdMapperWithFastCanonicalization_canonicalize_iana_mv1_result icu4x_TimeZoneIdMapperWithFastCanonicalization_canonicalize_iana_mv1(const TimeZoneIdMapperWithFastCanonicalization* self, DiplomatStringView value, DiplomatWrite* write);

typedef struct icu4x_TimeZoneIdMapperWithFastCanonicalization_canonical_iana_from_bcp47_mv1_result { bool is_ok;} icu4x_TimeZoneIdMapperWithFastCanonicalization_canonical_iana_from_bcp47_mv1_result;
icu4x_TimeZoneIdMapperWithFastCanonicalization_canonical_iana_from_bcp47_mv1_result icu4x_TimeZoneIdMapperWithFastCanonicalization_canonical_iana_from_bcp47_mv1(const TimeZoneIdMapperWithFastCanonicalization* self, DiplomatStringView value, DiplomatWrite* write);


void icu4x_TimeZoneIdMapperWithFastCanonicalization_destroy_mv1(TimeZoneIdMapperWithFastCanonicalization* self);





#endif // TimeZoneIdMapperWithFastCanonicalization_H
