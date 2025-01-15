// generated by diplomat-tool
import type { IsoDate } from "./IsoDate"
import type { Time } from "./Time"
import type { TimeZoneInfo } from "./TimeZoneInfo"
import type { pointer, codepoint } from "./diplomat-runtime.d.ts";


/** An ICU4X ZonedDateTime object capable of containing a ISO-8601 date, time, and zone.
*
*See the [Rust documentation for `ZonedDateTime`](https://docs.rs/icu/latest/icu/timezone/struct.ZonedDateTime.html) for more information.
*/


export class ZonedIsoDateTime {
    
    get date() : IsoDate;
    
    get time() : Time;
    
    get zone() : TimeZoneInfo;
    
}