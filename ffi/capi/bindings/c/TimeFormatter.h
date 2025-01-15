#ifndef TimeFormatter_H
#define TimeFormatter_H

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "diplomat_runtime.h"

#include "DataProvider.d.h"
#include "DateTimeFormatterLoadError.d.h"
#include "DateTimeLength.d.h"
#include "Locale.d.h"
#include "Time.d.h"

#include "TimeFormatter.d.h"






typedef struct icu4x_TimeFormatter_create_with_length_mv1_result {union {TimeFormatter* ok; DateTimeFormatterLoadError err;}; bool is_ok;} icu4x_TimeFormatter_create_with_length_mv1_result;
icu4x_TimeFormatter_create_with_length_mv1_result icu4x_TimeFormatter_create_with_length_mv1(const Locale* locale, DateTimeLength length);

typedef struct icu4x_TimeFormatter_create_with_length_and_provider_mv1_result {union {TimeFormatter* ok; DateTimeFormatterLoadError err;}; bool is_ok;} icu4x_TimeFormatter_create_with_length_and_provider_mv1_result;
icu4x_TimeFormatter_create_with_length_and_provider_mv1_result icu4x_TimeFormatter_create_with_length_and_provider_mv1(const DataProvider* provider, const Locale* locale, DateTimeLength length);

void icu4x_TimeFormatter_format_time_mv1(const TimeFormatter* self, const Time* value, DiplomatWrite* write);


void icu4x_TimeFormatter_destroy_mv1(TimeFormatter* self);





#endif // TimeFormatter_H
