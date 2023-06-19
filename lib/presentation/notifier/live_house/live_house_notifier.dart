import 'package:flutter/material.dart';
import 'package:live_house_nav/domain/live_house/live_house_list.dart';
import 'package:live_house_nav/domain/live_house/live_house_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../pages/map/status/live_house_map.dart';
import '../my_location/my_location_provider.dart';
part 'live_house_notifier.g.dart';

@riverpod
class LiveHouseNotifier extends _$LiveHouseNotifier {
  final baseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  final apiKey = "AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M";

  @override
  Future<LiveHouseMap> build() async {
    final myLocation = ref.watch(featchMyLocationProvider).requireValue;
    final _liveHouseService = ref.watch(liveHouseService);

    final Uri placeApiUri = Uri.parse(
        "$baseUrl?key=$apiKey&location=${myLocation.latitude},${myLocation.longitude}&radius=1000&language=ja&keyword=ライブハウス");

    LiveHouseList liveHouseList =
        await _liveHouseService.featchLiveHouseList(placeApiUri);
    return LiveHouseMap(
      results: liveHouseList,
      controller: null,
    );
  }
}
