// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$liveHouseNotifierHash() => r'0f822483e977f8053d00ec56302cbf7e56202be4';

/// See also [LiveHouseNotifier].
@ProviderFor(LiveHouseNotifier)
final liveHouseNotifierProvider = AutoDisposeAsyncNotifierProvider<
    LiveHouseNotifier, List<LiveHouse>>.internal(
  LiveHouseNotifier.new,
  name: r'liveHouseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveHouseNotifierHash,
  dependencies: <ProviderOrFamily>[featchMyLocationProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    featchMyLocationProvider,
    ...?featchMyLocationProvider.allTransitiveDependencies
  },
);

typedef _$LiveHouseNotifier = AutoDisposeAsyncNotifier<List<LiveHouse>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
