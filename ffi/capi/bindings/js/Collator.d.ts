// generated by diplomat-tool
import type { CollatorOptions } from "./CollatorOptions"
import type { CollatorResolvedOptions } from "./CollatorResolvedOptions"
import type { DataError } from "./DataError"
import type { DataProvider } from "./DataProvider"
import type { Locale } from "./Locale"
import type { pointer, codepoint } from "./diplomat-runtime.d.ts";


/** See the [Rust documentation for `Collator`](https://docs.rs/icu/latest/icu/collator/struct.Collator.html) for more information.
*/
export class Collator {
    

    get ffiValue(): pointer;

    static create(locale: Locale, options: CollatorOptions): Collator;

    static createWithProvider(provider: DataProvider, locale: Locale, options: CollatorOptions): Collator;

    compare(left: string, right: string): number;

    get resolvedOptions(): CollatorResolvedOptions;
}