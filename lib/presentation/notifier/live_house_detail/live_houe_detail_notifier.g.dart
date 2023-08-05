// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_houe_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$featchLiveHouseDetailHash() =>
    r'5bf95b47dbcf4baf4b4a25ce09393f938c83d80d';

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

typedef FeatchLiveHouseDetailRef = FutureProviderRef<LiveHouseDetail>;

/// See also [featchLiveHouseDetail].
@ProviderFor(featchLiveHouseDetail)
const featchLiveHouseDetailProvider = FeatchLiveHouseDetailFamily();

/// See also [featchLiveHouseDetail].
class FeatchLiveHouseDetailFamily extends Family<AsyncValue<LiveHouseDetail>> {
  /// See also [featchLiveHouseDetail].
  const FeatchLiveHouseDetailFamily();

  /// See also [featchLiveHouseDetail].
  FeatchLiveHouseDetailProvider call({
    required String priceId,
  }) {
    return FeatchLiveHouseDetailProvider(
      priceId: priceId,
    );
  }

  @override
  FeatchLiveHouseDetailProvider getProviderOverride(
    covariant FeatchLiveHouseDetailProvider provider,
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
  String? get name => r'featchLiveHouseDetailProvider';
}

/// See also [featchLiveHouseDetail].
class FeatchLiveHouseDetailProvider extends FutureProvider<LiveHouseDetail> {
  /// See also [featchLiveHouseDetail].
  FeatchLiveHouseDetailProvider({
    required this.priceId,
  }) : super.internal(
          (ref) => featchLiveHouseDetail(
            ref,
            priceId: priceId,
          ),
          from: featchLiveHouseDetailProvider,
          name: r'featchLiveHouseDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featchLiveHouseDetailHash,
          dependencies: FeatchLiveHouseDetailFamily._dependencies,
          allTransitiveDependencies:
              FeatchLiveHouseDetailFamily._allTransitiveDependencies,
        );

  final String priceId;

  @override
  bool operator ==(Object other) {
    return other is FeatchLiveHouseDetailProvider && other.priceId == priceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, priceId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
