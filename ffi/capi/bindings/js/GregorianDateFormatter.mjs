// generated by diplomat-tool
import { DataProvider } from "./DataProvider.mjs"
import { DateTimeFormatterLoadError } from "./DateTimeFormatterLoadError.mjs"
import { DateTimeLength } from "./DateTimeLength.mjs"
import { IsoDate } from "./IsoDate.mjs"
import { IsoDateTime } from "./IsoDateTime.mjs"
import { Locale } from "./Locale.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** An ICU4X TypedDateFormatter object capable of formatting a [`IsoDateTime`] as a string,
*using the Gregorian Calendar.
*
*See the [Rust documentation for `datetime`](https://docs.rs/icu/latest/icu/datetime/index.html) for more information.
*/
const GregorianDateFormatter_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_GregorianDateFormatter_destroy_mv1(ptr);
});

export class GregorianDateFormatter {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("GregorianDateFormatter is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            GregorianDateFormatter_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static createWithLength(locale, length) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_GregorianDateFormatter_create_with_length_mv1(diplomatReceive.buffer, locale.ffiValue, length.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DateTimeFormatterLoadError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DateTimeFormatterLoadError: ' + cause.value, { cause });
            }
            return new GregorianDateFormatter(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createWithLengthAndProvider(provider, locale, length) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_GregorianDateFormatter_create_with_length_and_provider_mv1(diplomatReceive.buffer, provider.ffiValue, locale.ffiValue, length.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DateTimeFormatterLoadError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DateTimeFormatterLoadError: ' + cause.value, { cause });
            }
            return new GregorianDateFormatter(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    formatIsoDate(value) {
        const write = new diplomatRuntime.DiplomatWriteBuf(wasm);
        wasm.icu4x_GregorianDateFormatter_format_iso_date_mv1(this.ffiValue, value.ffiValue, write.buffer);
    
        try {
            return write.readString8();
        }
        
        finally {
            write.free();
        }
    }

    formatIsoDatetime(value) {
        const write = new diplomatRuntime.DiplomatWriteBuf(wasm);
        wasm.icu4x_GregorianDateFormatter_format_iso_datetime_mv1(this.ffiValue, value.ffiValue, write.buffer);
    
        try {
            return write.readString8();
        }
        
        finally {
            write.free();
        }
    }
}