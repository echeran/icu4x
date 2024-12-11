// generated by diplomat-tool
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import { DisplayNamesOptions } from "./DisplayNamesOptions.mjs"
import { Locale } from "./Locale.mjs"
import { LocaleParseError } from "./LocaleParseError.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** See the [Rust documentation for `RegionDisplayNames`](https://docs.rs/icu/latest/icu/displaynames/struct.RegionDisplayNames.html) for more information.
*/
const RegionDisplayNames_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_RegionDisplayNames_destroy_mv1(ptr);
});

export class RegionDisplayNames {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("RegionDisplayNames is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            RegionDisplayNames_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static create(locale, options) {
        let functionCleanupArena = new diplomatRuntime.CleanupArena();
        
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_RegionDisplayNames_create_v1_mv1(diplomatReceive.buffer, locale.ffiValue, ...options._intoFFI(functionCleanupArena, {}));
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new RegionDisplayNames(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            functionCleanupArena.free();
        
            diplomatReceive.free();
        }
    }

    static createWithProvider(provider, locale, options) {
        let functionCleanupArena = new diplomatRuntime.CleanupArena();
        
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_RegionDisplayNames_create_v1_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue, locale.ffiValue, ...options._intoFFI(functionCleanupArena, {}));
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new RegionDisplayNames(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            functionCleanupArena.free();
        
            diplomatReceive.free();
        }
    }

    of(region) {
        let functionCleanupArena = new diplomatRuntime.CleanupArena();
        
        const regionSlice = functionCleanupArena.alloc(diplomatRuntime.DiplomatBuf.str8(wasm, region));
        
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const write = new diplomatRuntime.DiplomatWriteBuf(wasm);
        
        const result = wasm.icu4x_RegionDisplayNames_of_mv1(diplomatReceive.buffer, this.ffiValue, ...regionSlice.splat(), write.buffer);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new LocaleParseError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('LocaleParseError: ' + cause.value, { cause });
            }
            return write.readString8();
        }
        
        finally {
            functionCleanupArena.free();
        
            diplomatReceive.free();
        
            write.free();
        }
    }
}