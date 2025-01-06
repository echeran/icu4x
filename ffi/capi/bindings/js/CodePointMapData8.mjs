// generated by diplomat-tool
import { CodePointRangeIterator } from "./CodePointRangeIterator.mjs"
import { CodePointSetData } from "./CodePointSetData.mjs"
import { DataError } from "./DataError.mjs"
import { DataProvider } from "./DataProvider.mjs"
import { GeneralCategoryGroup } from "./GeneralCategoryGroup.mjs"
import wasm from "./diplomat-wasm.mjs";
import * as diplomatRuntime from "./diplomat-runtime.mjs";


/** An ICU4X Unicode Map Property object, capable of querying whether a code point (key) to obtain the Unicode property value, for a specific Unicode property.
*
*For properties whose values fit into 8 bits.
*
*See the [Rust documentation for `properties`](https://docs.rs/icu/latest/icu/properties/index.html) for more information.
*
*See the [Rust documentation for `CodePointMapData`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapData.html) for more information.
*
*See the [Rust documentation for `CodePointMapDataBorrowed`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html) for more information.
*/
const CodePointMapData8_box_destroy_registry = new FinalizationRegistry((ptr) => {
    wasm.icu4x_CodePointMapData8_destroy_mv1(ptr);
});

export class CodePointMapData8 {
    // Internal ptr reference:
    #ptr = null;

    // Lifetimes are only to keep dependencies alive.
    // Since JS won't garbage collect until there are no incoming edges.
    #selfEdge = [];
    
    constructor(symbol, ptr, selfEdge) {
        if (symbol !== diplomatRuntime.internalConstructor) {
            console.error("CodePointMapData8 is an Opaque type. You cannot call its constructor.");
            return;
        }
        
        this.#ptr = ptr;
        this.#selfEdge = selfEdge;
        
        // Are we being borrowed? If not, we can register.
        if (this.#selfEdge.length === 0) {
            CodePointMapData8_box_destroy_registry.register(this, this.#ptr);
        }
    }

    get ffiValue() {
        return this.#ptr;
    }

    get(cp) {
        const result = wasm.icu4x_CodePointMapData8_get_mv1(this.ffiValue, cp);
    
        try {
            return result;
        }
        
        finally {}
    }

    iterRangesForValue(value) {
        // This lifetime edge depends on lifetimes 'a
        let aEdges = [this];
        
        const result = wasm.icu4x_CodePointMapData8_iter_ranges_for_value_mv1(this.ffiValue, value);
    
        try {
            return new CodePointRangeIterator(diplomatRuntime.internalConstructor, result, [], aEdges);
        }
        
        finally {}
    }

    iterRangesForValueComplemented(value) {
        // This lifetime edge depends on lifetimes 'a
        let aEdges = [this];
        
        const result = wasm.icu4x_CodePointMapData8_iter_ranges_for_value_complemented_mv1(this.ffiValue, value);
    
        try {
            return new CodePointRangeIterator(diplomatRuntime.internalConstructor, result, [], aEdges);
        }
        
        finally {}
    }

    iterRangesForGroup(group) {
        let functionCleanupArena = new diplomatRuntime.CleanupArena();
        
        // This lifetime edge depends on lifetimes 'a
        let aEdges = [this];
        
        const result = wasm.icu4x_CodePointMapData8_iter_ranges_for_group_mv1(this.ffiValue, ...group._intoFFI(functionCleanupArena, {}));
    
        try {
            return new CodePointRangeIterator(diplomatRuntime.internalConstructor, result, [], aEdges);
        }
        
        finally {
            functionCleanupArena.free();
        }
    }

    getSetForValue(value) {
        const result = wasm.icu4x_CodePointMapData8_get_set_for_value_mv1(this.ffiValue, value);
    
        try {
            return new CodePointSetData(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createGeneralCategory() {
        const result = wasm.icu4x_CodePointMapData8_create_general_category_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createGeneralCategoryWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_general_category_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createBidiClass() {
        const result = wasm.icu4x_CodePointMapData8_create_bidi_class_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createBidiClassWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_bidi_class_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createEastAsianWidth() {
        const result = wasm.icu4x_CodePointMapData8_create_east_asian_width_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createEastAsianWidthWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_east_asian_width_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createHangulSyllableType() {
        const result = wasm.icu4x_CodePointMapData8_create_hangul_syllable_type_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createHangulSyllableTypeWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_hangul_syllable_type_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createIndicSyllabicCategory() {
        const result = wasm.icu4x_CodePointMapData8_create_indic_syllabic_category_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createIndicSyllabicCategoryWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_indic_syllabic_category_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createLineBreak() {
        const result = wasm.icu4x_CodePointMapData8_create_line_break_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createLineBreakWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_line_break_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createGraphemeClusterBreak() {
        const result = wasm.icu4x_CodePointMapData8_create_grapheme_cluster_break_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createGraphemeClusterBreakWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_grapheme_cluster_break_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createWordBreak() {
        const result = wasm.icu4x_CodePointMapData8_create_word_break_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createWordBreakWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_word_break_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createSentenceBreak() {
        const result = wasm.icu4x_CodePointMapData8_create_sentence_break_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createSentenceBreakWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_sentence_break_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createJoiningType() {
        const result = wasm.icu4x_CodePointMapData8_create_joining_type_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createJoiningTypeWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_joining_type_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }

    static createCanonicalCombiningClass() {
        const result = wasm.icu4x_CodePointMapData8_create_canonical_combining_class_mv1();
    
        try {
            return new CodePointMapData8(diplomatRuntime.internalConstructor, result, []);
        }
        
        finally {}
    }

    static createCanonicalCombiningClassWithProvider(provider) {
        const diplomatReceive = new diplomatRuntime.DiplomatReceiveBuf(wasm, 5, 4, true);
        
        const result = wasm.icu4x_CodePointMapData8_create_canonical_combining_class_with_provider_mv1(diplomatReceive.buffer, provider.ffiValue);
    
        try {
            if (!diplomatReceive.resultFlag) {
                const cause = new DataError(diplomatRuntime.internalConstructor, diplomatRuntime.enumDiscriminant(wasm, diplomatReceive.buffer));
                throw new globalThis.Error('DataError: ' + cause.value, { cause });
            }
            return new CodePointMapData8(diplomatRuntime.internalConstructor, diplomatRuntime.ptrRead(wasm, diplomatReceive.buffer), []);
        }
        
        finally {
            diplomatReceive.free();
        }
    }
}