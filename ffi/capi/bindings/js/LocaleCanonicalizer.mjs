// generated by diplomat-tool
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import { Locale } from "./Locale.mjs"
import { TransformResult } from "./TransformResult.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** A locale canonicalizer.
*
*See the [Rust documentation for `LocaleCanonicalizer`](https://docs.rs/icu/latest/icu/locale/struct.LocaleCanonicalizer.html) for more information.
*/
const LocaleCanonicalizer_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_LocaleCanonicalizer_destroy_mv1(ptr);
});

export class LocaleCanonicalizer {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("LocaleCanonicalizer is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            LocaleCanonicalizer_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    static create() {
        const result = wasm.icu4x_LocaleCanonicalizer_create_mv1();
    
        try {
            return new LocaleCanonicalizer(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_LocaleCanonicalizer_create_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new LocaleCanonicalizer(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createExtended() {
        const result = wasm.icu4x_LocaleCanonicalizer_create_extended_mv1();
    
        try {
            return new LocaleCanonicalizer(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createExtendedWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_LocaleCanonicalizer_create_extended_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new LocaleCanonicalizer(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    canonicalize(locale) {
        const result = wasm.icu4x_LocaleCanonicalizer_canonicalize_mv1(this.ffiValue, locale.ffiValue);
    
        try {
            return new TransformResult(diplomatRuntime.internalConstructor, result);
        }
        
        finally {}
    }
}