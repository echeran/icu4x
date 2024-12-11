// generated by diplomat-tool
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import { Decomposed } from "./Decomposed.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** The raw (non-recursive) canonical decomposition operation.
*
*Callers should generally use DecomposingNormalizer unless they specifically need raw composition operations
*
*See the [Rust documentation for `CanonicalDecomposition`](https://docs.rs/icu/latest/icu/normalizer/properties/struct.CanonicalDecomposition.html) for more information.
*/
const CanonicalDecomposition_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_CanonicalDecomposition_destroy_mv1(ptr);
});

export class CanonicalDecomposition {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("CanonicalDecomposition is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            CanonicalDecomposition_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static create() {
        const result = wasm.icu4x_CanonicalDecomposition_create_mv1();
    
        try {
            return new CanonicalDecomposition(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CanonicalDecomposition_create_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CanonicalDecomposition(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    decompose(c) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 8, 4, false);
        
        const result = wasm.icu4x_CanonicalDecomposition_decompose_mv1(diplomatReceive.buffer, this.ffiValue, c);
    
        try {
            return Decomposed._fromFFI(diplomatRuntime.internalConstructor, diplomatReceive.buffer);
        }
        
        finally {
            diplomatReceive.free();
        }
    }
}