// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/master/LICENSE ).

#[derive(Clone, PartialEq, Debug)]
enum EnumeratedProperty {
    BidiClass,
    BidiPairedBracketType,
    CanonicalCombiningClass,
    DecompositionType,
    EastAsianWidth,
    GeneralCategory,
    GraphemeClusterBreak,
    HangulSyllableType,
    IndicPositionalCategory,
    IndicSyllabicCategory,
    JoiningGroup,
    JoiningType,
    LineBreak,
    LeadCanonicalCombiningClass,
    NFCQuickCheck,
    NFDQuickCheck,
    NFKCQuickCheck,
    NFKDQuickCheck,
    NumericType,
    SentenceBreak,
    TrailCanonicalCombiningClass,
    VerticalOrientation,
    WordBreak,
}

#[derive(Clone, PartialEq, Debug)]
enum BidiClass {
    ArabicLetter,
    ArabicNumber,
    ParagraphSeparator,
    BoundaryNeutral,
    CommonSeparator,
    EuropeanNumber,
    EuropeanSeparator,
    EuropeanTerminator,
    FirstStrongIsolate,
    LeftToRight,
    LeftToRightEmbedding,
    LeftToRightIsolate,
    LeftToRightOverride,
    NonspacingMark,
    OtherNeutral,
    PopDirectionalFormat,
    PopDirectionalIsolate,
    RightToLeft,
    RightToLeftEmbedding,
    RightToLeftIsolate,
    RightToLeftOverride,
    SegmentSeparator,
    WhiteSpace,
}

#[derive(Clone, PartialEq, Debug)]
enum BidiPairedBracketType {
    Close,
    None,
    Open,
}

#[derive(Clone, PartialEq, Debug)]
enum CanonicalCombiningClass {
    NotReordered,
    Overlay,
    CCC10,
    CCC103,
    CCC107,
    CCC11,
    CCC118,
    CCC12,
    CCC122,
    CCC129,
    CCC13,
    CCC130,
    CCC132,
    CCC133,
    CCC14,
    CCC15,
    CCC16,
    CCC17,
    CCC18,
    CCC19,
    CCC20,
    AttachedBelowLeft,
    AttachedBelow,
    CCC21,
    AttachedAbove,
    AttachedAboveRight,
    BelowLeft,
    CCC22,
    Below,
    BelowRight,
    Left,
    Right,
    AboveLeft,
    CCC23,
    Above,
    AboveRight,
    DoubleBelow,
    DoubleAbove,
    CCC24,
    IotaSubscript,
    CCC25,
    CCC26,
    CCC27,
    CCC28,
    CCC29,
    CCC30,
    CCC31,
    CCC32,
    CCC33,
    CCC34,
    CCC35,
    CCC36,
    HanReading,
    Nukta,
    KanaVoicing,
    CCC84,
    Virama,
    CCC91,
}

#[derive(Clone, PartialEq, Debug)]
enum DecompositionType {
    Can,
    Com,
    Enc,
    Fin,
    Font,
    Fra,
    Init,
    Iso,
    Med,
    Nar,
    Nb,
    None,
    Sml,
    Sqr,
    Sub,
    Sup,
    Vert,
    Wide,
}

#[derive(Clone, PartialEq, Debug)]
enum EastAsianWidth {
    Ambiguous,
    Fullwidth,
    Halfwidth,
    Neutral,
    Narrow,
    Wide,
}

#[derive(Clone, PartialEq, Debug)]
enum GeneralCategory {
    Other,
    Cntrl,
    Format,
    Unassigned,
    PrivateUse,
    Surrogate,
    Letter,
    CasedLetter,
    LowercaseLetter,
    ModifierLetter,
    OtherLetter,
    TitlecaseLetter,
    UppercaseLetter,
    CombiningMark,
    SpacingMark,
    EnclosingMark,
    NonspacingMark,
    Number,
    Digit,
    LetterNumber,
    OtherNumber,
    Punct,
    ConnectorPunctuation,
    DashPunctuation,
    ClosePunctuation,
    FinalPunctuation,
    InitialPunctuation,
    OtherPunctuation,
    OpenPunctuation,
    Symbol,
    CurrencySymbol,
    ModifierSymbol,
    MathSymbol,
    OtherSymbol,
    Separator,
    LineSeparator,
    ParagraphSeparator,
    SpaceSeparator,
}

#[derive(Clone, PartialEq, Debug)]
enum GraphemeClusterBreak {
    Control,
    CR,
    EBase,
    EBaseGAZ,
    EModifier,
    Extend,
    GlueAfterZwj,
    L,
    LF,
    LV,
    LVT,
    Prepend,
    RegionalIndicator,
    SpacingMark,
    T,
    V,
    Other,
    ZWJ,
}

#[derive(Clone, PartialEq, Debug)]
enum HangulSyllableType {
    LeadingJamo,
    LVSyllable,
    LVTSyllable,
    NotApplicable,
    TrailingJamo,
    VowelJamo,
}

#[derive(Clone, PartialEq, Debug)]
enum IndicPositionalCategory {
    Bottom,
    BottomAndLeft,
    BottomAndRight,
    Left,
    LeftAndRight,
    NA,
    Overstruck,
    Right,
    Top,
    TopAndBottom,
    TopAndBottomAndLeft,
    TopAndBottomAndRight,
    TopAndLeft,
    TopAndLeftAndRight,
    TopAndRight,
    VisualOrderLeft,
}

#[derive(Clone, PartialEq, Debug)]
enum IndicSyllabicCategory {
    Avagraha,
    Bindu,
    BrahmiJoiningNumber,
    CantillationMark,
    Consonant,
    ConsonantDead,
    ConsonantFinal,
    ConsonantHeadLetter,
    ConsonantInitialPostfixed,
    ConsonantKiller,
    ConsonantMedial,
    ConsonantPlaceholder,
    ConsonantPrecedingRepha,
    ConsonantPrefixed,
    ConsonantSubjoined,
    ConsonantSucceedingRepha,
    ConsonantWithStacker,
    GeminationMark,
    InvisibleStacker,
    Joiner,
    ModifyingLetter,
    NonJoiner,
    Nukta,
    Number,
    NumberJoiner,
    Other,
    PureKiller,
    RegisterShifter,
    SyllableModifier,
    ToneLetter,
    ToneMark,
    Virama,
    Visarga,
    Vowel,
    VowelDependent,
    VowelIndependent,
}

#[derive(Clone, PartialEq, Debug)]
enum JoiningGroup {
    AfricanFeh,
    AfricanNoon,
    AfricanQaf,
    Ain,
    Alaph,
    Alef,
    Beh,
    Beth,
    BurushaskiYehBarree,
    Dal,
    DalathRish,
    E,
    FarsiYeh,
    Fe,
    Feh,
    FinalSemkath,
    Gaf,
    Gamal,
    Hah,
    HanifiRohingyaKinnaYa,
    HanifiRohingyaPa,
    He,
    Heh,
    HehGoal,
    Heth,
    Kaf,
    Kaph,
    Khaph,
    KnottedHeh,
    Lam,
    Lamadh,
    MalayalamBha,
    MalayalamJa,
    MalayalamLla,
    MalayalamLlla,
    MalayalamNga,
    MalayalamNna,
    MalayalamNnna,
    MalayalamNya,
    MalayalamRa,
    MalayalamSsa,
    MalayalamTta,
    ManichaeanAleph,
    ManichaeanAyin,
    ManichaeanBeth,
    ManichaeanDaleth,
    ManichaeanDhamedh,
    ManichaeanFive,
    ManichaeanGimel,
    ManichaeanHeth,
    ManichaeanHundred,
    ManichaeanKaph,
    ManichaeanLamedh,
    ManichaeanMem,
    ManichaeanNun,
    ManichaeanOne,
    ManichaeanPe,
    ManichaeanQoph,
    ManichaeanResh,
    ManichaeanSadhe,
    ManichaeanSamekh,
    ManichaeanTaw,
    ManichaeanTen,
    ManichaeanTeth,
    ManichaeanThamedh,
    ManichaeanTwenty,
    ManichaeanWaw,
    ManichaeanYodh,
    ManichaeanZayin,
    Meem,
    Mim,
    NoJoiningGroup,
    Noon,
    Nun,
    Nya,
    Pe,
    Qaf,
    Qaph,
    Reh,
    ReversedPe,
    RohingyaYeh,
    Sad,
    Sadhe,
    Seen,
    Semkath,
    Shin,
    StraightWaw,
    SwashKaf,
    SyriacWaw,
    Tah,
    Taw,
    TehMarbuta,
    HamzaOnHehGoal,
    Teth,
    Waw,
    Yeh,
    YehBarree,
    YehWithTail,
    Yudh,
    YudhHe,
    Zain,
    Zhain,
}

#[derive(Clone, PartialEq, Debug)]
enum JoiningType {
    JoinCausing,
    DualJoining,
    LeftJoining,
    RightJoining,
    Transparent,
    NonJoining,
}

#[derive(Clone, PartialEq, Debug)]
enum LineBreak {
    Ambiguous,
    Alphabetic,
    BreakBoth,
    BreakAfter,
    BreakBefore,
    MandatoryBreak,
    ContingentBreak,
    ConditionalJapaneseStarter,
    ClosePunctuation,
    CombiningMark,
    CloseParenthesis,
    CarriageReturn,
    EBase,
    EModifier,
    Exclamation,
    Glue,
    H2,
    H3,
    HebrewLetter,
    Hyphen,
    Ideographic,
    Inseperable,
    InfixNumeric,
    JL,
    JT,
    JV,
    LineFeed,
    NextLine,
    Nonstarter,
    Numeric,
    OpenPunctuation,
    PostfixNumeric,
    PrefixNumeric,
    Quotation,
    RegionalIndicator,
    ComplexContext,
    Surrogate,
    Space,
    BreakSymbols,
    WordJoiner,
    Unknown,
    ZWSpace,
    ZWJ,
}

#[derive(Clone, PartialEq, Debug)]
enum LeadCanonicalCombiningClass {
    NotReordered,
    Overlay,
    CCC10,
    CCC103,
    CCC107,
    CCC11,
    CCC118,
    CCC12,
    CCC122,
    CCC129,
    CCC13,
    CCC130,
    CCC132,
    CCC133,
    CCC14,
    CCC15,
    CCC16,
    CCC17,
    CCC18,
    CCC19,
    CCC20,
    AttachedBelowLeft,
    AttachedBelow,
    CCC21,
    AttachedAbove,
    AttachedAboveRight,
    BelowLeft,
    CCC22,
    Below,
    BelowRight,
    Left,
    Right,
    AboveLeft,
    CCC23,
    Above,
    AboveRight,
    DoubleBelow,
    DoubleAbove,
    CCC24,
    IotaSubscript,
    CCC25,
    CCC26,
    CCC27,
    CCC28,
    CCC29,
    CCC30,
    CCC31,
    CCC32,
    CCC33,
    CCC34,
    CCC35,
    CCC36,
    HanReading,
    Nukta,
    KanaVoicing,
    CCC84,
    Virama,
    CCC91,
}

#[derive(Clone, PartialEq, Debug)]
enum NFCQuickCheck {
    Maybe,
    No,
    Yes,
}

#[derive(Clone, PartialEq, Debug)]
enum NFDQuickCheck {
    No,
    Yes,
}

#[derive(Clone, PartialEq, Debug)]
enum NFKCQuickCheck {
    Maybe,
    No,
    Yes,
}

#[derive(Clone, PartialEq, Debug)]
enum NFKDQuickCheck {
    No,
    Yes,
}

#[derive(Clone, PartialEq, Debug)]
enum NumericType {
    Decimal,
    Digit,
    None,
    Numeric,
}

#[derive(Clone, PartialEq, Debug)]
enum SentenceBreak {
    ATerm,
    Close,
    CR,
    Extend,
    Format,
    OLetter,
    LF,
    Lower,
    Numeric,
    SContinue,
    Sep,
    Sp,
    STerm,
    Upper,
    Other,
}

#[derive(Clone, PartialEq, Debug)]
enum TrailCanonicalCombiningClass {
    NotReordered,
    Overlay,
    CCC10,
    CCC103,
    CCC107,
    CCC11,
    CCC118,
    CCC12,
    CCC122,
    CCC129,
    CCC13,
    CCC130,
    CCC132,
    CCC133,
    CCC14,
    CCC15,
    CCC16,
    CCC17,
    CCC18,
    CCC19,
    CCC20,
    AttachedBelowLeft,
    AttachedBelow,
    CCC21,
    AttachedAbove,
    AttachedAboveRight,
    BelowLeft,
    CCC22,
    Below,
    BelowRight,
    Left,
    Right,
    AboveLeft,
    CCC23,
    Above,
    AboveRight,
    DoubleBelow,
    DoubleAbove,
    CCC24,
    IotaSubscript,
    CCC25,
    CCC26,
    CCC27,
    CCC28,
    CCC29,
    CCC30,
    CCC31,
    CCC32,
    CCC33,
    CCC34,
    CCC35,
    CCC36,
    HanReading,
    Nukta,
    KanaVoicing,
    CCC84,
    Virama,
    CCC91,
}

#[derive(Clone, PartialEq, Debug)]
enum VerticalOrientation {
    Rotated,
    TransformedRotated,
    TransformedUpright,
    Upright,
}

#[derive(Clone, PartialEq, Debug)]
enum WordBreak {
    CR,
    DoubleQuote,
    EBase,
    EBaseGAZ,
    EModifier,
    ExtendNumLet,
    Extend,
    Format,
    GlueAfterZwj,
    HebrewLetter,
    Katakana,
    ALetter,
    LF,
    MidNumLet,
    MidLetter,
    MidNum,
    Newline,
    Numeric,
    RegionalIndicator,
    SingleQuote,
    WSegSpace,
    Other,
    ZWJ,
}