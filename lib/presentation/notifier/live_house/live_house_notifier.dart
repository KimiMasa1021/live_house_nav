import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/live_house/value/live_house.dart';
import '../../../infrastructure/live_house/live_house_repository.dart';
import '../my_location/my_location_provider.dart';
part 'live_house_notifier.g.dart';

@Riverpod(dependencies: [featchMyLocation])
class LiveHouseNotifier extends _$LiveHouseNotifier {
  @override
  Future<List<LiveHouse>> build() async {
    final myLocation = ref.watch(featchMyLocationProvider).requireValue;
    final test = ref.watch(LiveHouseRepositoryProvider);

    final response = await test.featchLiveHouse(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M&location=35.661556852267985, 139.66687737153256&radius=1000&language=ja&keyword=ライブハウス"));

    return [];
  }
}
