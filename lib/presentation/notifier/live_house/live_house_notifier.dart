import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_house_nav/presentation/notifier/map/map_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/live_house_list/live_house_list.dart';
import '../../../domain/live_house_list/live_house_service.dart';
import '../my_location/my_location_provider.dart';
part 'live_house_notifier.g.dart';

@riverpod
class LiveHouseNotifier extends _$LiveHouseNotifier {
  final basePlaceApiUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  final baseImageRefApiUrl =
      "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&";
  final apiKey = "AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M";

  @override
  Future<LiveHouseList> build() async {
    final myLocation = ref.watch(featchMyLocationProvider).requireValue;
    final _liveHouseService = ref.watch(liveHouseService);
    final mapCTL = ref.watch(mapNotifierProvider.notifier);

    final Uri placeApiUri = Uri.parse(
        "$basePlaceApiUrl?key=$apiKey&location=${myLocation.latitude},${myLocation.longitude}&language=ja&keyword=ライブハウス,livehouse&rankby=distance");

    LiveHouseList liveHouseList =
        await _liveHouseService.featchLiveHouseList(placeApiUri);

    final testList = liveHouseList.results.map((e) {
      String imageApiUri = "";
      if (e.photos.isNotEmpty) {
        var photoReference = e.photos[0].photoReference;
        imageApiUri =
            "${baseImageRefApiUrl}photo_reference=$photoReference&key=$apiKey";
      }

      return e.copyWith(imageUrl: imageApiUri);
    }).toList();

    liveHouseList = liveHouseList.copyWith(results: testList);
    await mapCTL.setCamera(testList);
    return liveHouseList;
  }

  Future<void> featchLiveHouse(LatLng latLng) async {
    final _liveHouseService = ref.watch(liveHouseService);
    final mapCTL = ref.watch(mapNotifierProvider.notifier);

    final Uri placeApiUri = Uri.parse(
        "$basePlaceApiUrl?key=$apiKey&location=${latLng.latitude},${latLng.longitude}&language=ja&keyword=ライブハウス,livehouse&rankby=distance");

    LiveHouseList liveHouseList =
        await _liveHouseService.featchLiveHouseList(placeApiUri);

    final testList = liveHouseList.results.map((e) {
      String imageApiUri = "";
      if (e.photos.isNotEmpty) {
        var photoReference = e.photos[0].photoReference;
        imageApiUri =
            "${baseImageRefApiUrl}photo_reference=$photoReference&key=$apiKey";
      }

      return e.copyWith(imageUrl: imageApiUri);
    }).toList();

    liveHouseList = liveHouseList.copyWith(results: testList);
    await mapCTL.setCamera(testList);
    state = AsyncValue.data(liveHouseList);
  }
}
