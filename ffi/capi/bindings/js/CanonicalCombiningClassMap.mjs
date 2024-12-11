// generated by diplomat-tool
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** Lookup of the Canonical_Combining_Class Unicode property
*
*See the [Rust documentation for `CanonicalCombiningClassMap`](https://docs.rs/icu/latest/icu/normalizer/properties/struct.CanonicalCombiningClassMap.html) for more information.
*/
const CanonicalCombiningClassMap_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_CanonicalCombiningClassMap_destroy_mv1(ptr);
});

export class CanonicalCombiningClassMap {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("CanonicalCombiningClassMap is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            CanonicalCombiningClassMap_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static create() {
        const result = wasm.icu4x_CanonicalCombiningClassMap_create_mv1();
    
        try {
            return new CanonicalCombiningClassMap(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CanonicalCombiningClassMap_create_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CanonicalCombiningClassMap(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    get(ch) {
        const result = wasm.icu4x_CanonicalCombiningClassMap_get_mv1(this.ffiValue, ch);
    
        try {
            return result;
        }
        
        finally {}
    }
}