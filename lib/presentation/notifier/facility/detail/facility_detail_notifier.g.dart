// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featchFacilityDetailHash() =>
    r'0bd7a3775081b6ee657d88242d37fd5130a60599';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [featchFacilityDetail].
@ProviderFor(featchFacilityDetail)
const featchFacilityDetailProvider = FeatchFacilityDetailFamily();

/// See also [featchFacilityDetail].
class FeatchFacilityDetailFamily extends Family<AsyncValue<FacilityDetail>> {
  /// See also [featchFacilityDetail].
  const FeatchFacilityDetailFamily();

  /// See also [featchFacilityDetail].
  FeatchFacilityDetailProvider call({
    required String priceId,
  }) {
    return FeatchFacilityDetailProvider(
      priceId: priceId,
    );
  }

  @override
  FeatchFacilityDetailProvider getProviderOverride(
    covariant FeatchFacilityDetailProvider provider,
  ) {
    return call(
      priceId: provider.priceId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'featchFacilityDetailProvider';
}

/// See also [featchFacilityDetail].
class FeatchFacilityDetailProvider extends FutureProvider<FacilityDetail> {
  /// See also [featchFacilityDetail].
  FeatchFacilityDetailProvider({
    required String priceId,
  }) : this._internal(
          (ref) => featchFacilityDetail(
            ref as FeatchFacilityDetailRef,
            priceId: priceId,
          ),
          from: featchFacilityDetailProvider,
          name: r'featchFacilityDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featchFacilityDetailHash,
          dependencies: FeatchFacilityDetailFamily._dependencies,
          allTransitiveDependencies:
              FeatchFacilityDetailFamily._allTransitiveDependencies,
          priceId: priceId,
        );

  FeatchFacilityDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.priceId,
  }) : super.internal();

  final String priceId;

  @override
  Override overrideWith(
    FutureOr<FacilityDetail> Function(FeatchFacilityDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeatchFacilityDetailProvider._internal(
        (ref) => create(ref as FeatchFacilityDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        priceId: priceId,
      ),
    );
  }

  @override
  FutureProviderElement<FacilityDetail> createElement() {
    return _FeatchFacilityDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeatchFacilityDetailProvider && other.priceId == priceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, priceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeatchFacilityDetailRef on FutureProviderRef<FacilityDetail> {
  /// The parameter `priceId` of this provider.
  String get priceId;
}

class _FeatchFacilityDetailProviderElement
    extends FutureProviderElement<FacilityDetail> with FeatchFacilityDetailRef {
  _FeatchFacilityDetailProviderElement(super.provider);

  @override
  String get priceId => (origin as FeatchFacilityDetailProvider).priceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
