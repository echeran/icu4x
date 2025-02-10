// @generated
include!("zone_offset_period_v1.rs.data");
include!("windows_zones_to_bcp47_map_v1.rs.data");
include!("iana_to_bcp47_map_v3.rs.data");
include!("bcp47_to_iana_map_v1.rs.data");
/// Marks a type as a data provider. You can then use macros like
/// `impl_core_helloworld_v1` to add implementations.
///
/// ```ignore
/// struct MyProvider;
/// const _: () = {
///     include!("path/to/generated/macros.rs");
///     make_provider!(MyProvider);
///     impl_core_helloworld_v1!(MyProvider);
/// }
/// ```
#[doc(hidden)]
#[macro_export]
macro_rules! __make_provider {
    ($ name : ty) => {
        #[clippy::msrv = "1.81"]
        impl $name {
            #[allow(dead_code)]
            pub(crate) const MUST_USE_MAKE_PROVIDER_MACRO: () = ();
        }
        icu_provider::marker::impl_data_provider_never_marker!($name);
    };
}
#[doc(inline)]
pub use __make_provider as make_provider;
#[allow(unused_macros)]
macro_rules! impl_data_provider {
    ($ provider : ty) => {
        make_provider!($provider);
        impl_zone_offset_period_v1!($provider);
        impl_windows_zones_to_bcp47_map_v1!($provider);
        impl_iana_to_bcp47_map_v3!($provider);
        impl_bcp47_to_iana_map_v1!($provider);
    };
}
