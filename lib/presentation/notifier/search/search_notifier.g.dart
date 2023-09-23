// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchNotifierHash() => r'8c59ab55992b08ebd13986bb13840374d7136ace';

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

abstract class _$SearchNotifier extends BuildlessAsyncNotifier<List<Facility>> {
  late final String facilityValue;

  FutureOr<List<Facility>> build(
    String facilityValue,
  );
}

/// See also [SearchNotifier].
@ProviderFor(SearchNotifier)
const searchNotifierProvider = SearchNotifierFamily();

/// See also [SearchNotifier].
class SearchNotifierFamily extends Family<AsyncValue<List<Facility>>> {
  /// See also [SearchNotifier].
  const SearchNotifierFamily();

  /// See also [SearchNotifier].
  SearchNotifierProvider call(
    String facilityValue,
  ) {
    return SearchNotifierProvider(
      facilityValue,
    );
  }

  @override
  SearchNotifierProvider getProviderOverride(
    covariant SearchNotifierProvider provider,
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
  String? get name => r'searchNotifierProvider';
}

/// See also [SearchNotifier].
class SearchNotifierProvider
    extends AsyncNotifierProviderImpl<SearchNotifier, List<Facility>> {
  /// See also [SearchNotifier].
  SearchNotifierProvider(
    String facilityValue,
  ) : this._internal(
          () => SearchNotifier()..facilityValue = facilityValue,
          from: searchNotifierProvider,
          name: r'searchNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchNotifierHash,
          dependencies: SearchNotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchNotifierFamily._allTransitiveDependencies,
          facilityValue: facilityValue,
        );

  SearchNotifierProvider._internal(
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
    covariant SearchNotifier notifier,
  ) {
    return notifier.build(
      facilityValue,
    );
  }

  @override
  Override overrideWith(SearchNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchNotifierProvider._internal(
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
  AsyncNotifierProviderElement<SearchNotifier, List<Facility>> createElement() {
    return _SearchNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchNotifierProvider &&
        other.facilityValue == facilityValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchNotifierRef on AsyncNotifierProviderRef<List<Facility>> {
  /// The parameter `facilityValue` of this provider.
  String get facilityValue;
}

class _SearchNotifierProviderElement
    extends AsyncNotifierProviderElement<SearchNotifier, List<Facility>>
    with SearchNotifierRef {
  _SearchNotifierProviderElement(super.provider);

  @override
  String get facilityValue => (origin as SearchNotifierProvider).facilityValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
