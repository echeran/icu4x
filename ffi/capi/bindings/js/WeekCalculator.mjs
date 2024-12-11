// generated by diplomat-tool
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import { IsoWeekday } from "./IsoWeekday.mjs"
import { Locale } from "./Locale.mjs"
import { WeekendContainsDay } from "./WeekendContainsDay.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** A Week calculator, useful to be passed in to `week_of_year()` on Date and DateTime types
*
*See the [Rust documentation for `WeekCalculator`](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html) for more information.
*/
const WeekCalculator_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_WeekCalculator_destroy_mv1(ptr);
});

export class WeekCalculator {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("WeekCalculator is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            WeekCalculator_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static create(locale) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_WeekCalculator_create_mv1(diplomatReceive.buffer, locale.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new WeekCalculator(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createWithProvider(provider, locale) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_WeekCalculator_create_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue, locale.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new WeekCalculator(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static fromFirstDayOfWeekAndMinWeekDays(firstWeekday, minWeekDays) {
        const result = wasm.icu4x_WeekCalculator_from_first_day_of_week_and_min_week_days_mv1(firstWeekday.ffiValue, minWeekDays);
    
        try {
            return new WeekCalculator(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    get firstWeekday() {
        const result = wasm.icu4x_WeekCalculator_first_weekday_mv1(this.ffiValue);
    
        try {
            return new IsoWeekday(diplomatRuntime.internalConstructor, result);
        }
        
        finally {}
    }

    get minWeekDays() {
        const result = wasm.icu4x_WeekCalculator_min_week_days_mv1(this.ffiValue);
    
        try {
            return result;
        }
        
        finally {}
    }

    get weekend() {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 7, 1, false);
        
        const result = wasm.icu4x_WeekCalculator_weekend_mv1(diplomatReceive.buffer, this.ffiValue);
    
        try {
            return WeekendContainsDay._fromFFI(diplomatRuntime.internalConstructor, diplomatReceive.buffer);
        }
        
        finally {
            diplomatReceive.free();
        }
    }
}