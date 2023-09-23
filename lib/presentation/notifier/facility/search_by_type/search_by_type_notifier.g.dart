// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_by_type_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchByTypeNotifierHash() =>
    r'968c655308a01c96636d62da3b3c944553414931';

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

abstract class _$SearchByTypeNotifier
    extends BuildlessAsyncNotifier<List<Facility>> {
  late final String facilityValue;

  FutureOr<List<Facility>> build(
    String facilityValue,
  );
}

/// See also [SearchByTypeNotifier].
@ProviderFor(SearchByTypeNotifier)
const searchByTypeNotifierProvider = SearchByTypeNotifierFamily();

/// See also [SearchByTypeNotifier].
class SearchByTypeNotifierFamily extends Family<AsyncValue<List<Facility>>> {
  /// See also [SearchByTypeNotifier].
  const SearchByTypeNotifierFamily();

  /// See also [SearchByTypeNotifier].
  SearchByTypeNotifierProvider call(
    String facilityValue,
  ) {
    return SearchByTypeNotifierProvider(
      facilityValue,
    );
  }

  @override
  SearchByTypeNotifierProvider getProviderOverride(
    covariant SearchByTypeNotifierProvider provider,
  ) {
    return call(
      provider.facilityValue,
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
  String? get name => r'searchByTypeNotifierProvider';
}

/// See also [SearchByTypeNotifier].
class SearchByTypeNotifierProvider
    extends AsyncNotifierProviderImpl<SearchByTypeNotifier, List<Facility>> {
  /// See also [SearchByTypeNotifier].
  SearchByTypeNotifierProvider(
    String facilityValue,
  ) : this._internal(
          () => SearchByTypeNotifier()..facilityValue = facilityValue,
          from: searchByTypeNotifierProvider,
          name: r'searchByTypeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchByTypeNotifierHash,
          dependencies: SearchByTypeNotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchByTypeNotifierFamily._allTransitiveDependencies,
          facilityValue: facilityValue,
        );

  SearchByTypeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityValue,
  }) : super.internal();

  final String facilityValue;

  @override
  FutureOr<List<Facility>> runNotifierBuild(
    covariant SearchByTypeNotifier notifier,
  ) {
    return notifier.build(
      facilityValue,
    );
  }

  @override
  Override overrideWith(SearchByTypeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchByTypeNotifierProvider._internal(
        () => create()..facilityValue = facilityValue,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityValue: facilityValue,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<SearchByTypeNotifier, List<Facility>>
      createElement() {
    return _SearchByTypeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchByTypeNotifierProvider &&
        other.facilityValue == facilityValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchByTypeNotifierRef on AsyncNotifierProviderRef<List<Facility>> {
  /// The parameter `facilityValue` of this provider.
  String get facilityValue;
}

class _SearchByTypeNotifierProviderElement
    extends AsyncNotifierProviderElement<SearchByTypeNotifier, List<Facility>>
    with SearchByTypeNotifierRef {
  _SearchByTypeNotifierProviderElement(super.provider);

  @override
  String get facilityValue =>
      (origin as SearchByTypeNotifierProvider).facilityValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
