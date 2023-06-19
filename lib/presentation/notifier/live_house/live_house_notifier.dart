import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/live_house_list/live_house_list.dart';
import '../../../domain/live_house_list/live_house_service.dart';
import '../../../domain/live_house_list/value/live_house/live_house.dart';
import '../../pages/map/status/live_house_map.dart';
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
  Future<LiveHouseMap> build() async {
    final myLocation = ref.watch(featchMyLocationProvider).requireValue;
    final _liveHouseService = ref.watch(liveHouseService);

    final Uri placeApiUri = Uri.parse(
        "$basePlaceApiUrl?key=$apiKey&location=${myLocation.latitude},${myLocation.longitude}&radius=1000&language=ja&keyword=ライブハウス");

    LiveHouseList liveHouseList =
        await _liveHouseService.featchLiveHouseList(placeApiUri);

    final testList = liveHouseList.results.map((e) {
      var photoReference = e.photos[0].photoReference;
      final imageApiUri =
          "${baseImageRefApiUrl}photo_reference=$photoReference&key=$apiKey";
      // final url =  _liveHouseService.featchThumbnailUrl(imageApiUri);

      return e.copyWith(imageUrl: imageApiUri);
    }).toList();
    // final lastList =
    //     await Future.wait(testList).then((List<LiveHouse> results) {
    //   return results;
    // });

    liveHouseList = liveHouseList.copyWith(results: testList);
    return LiveHouseMap(
      results: liveHouseList,
      controller: null,
    );
  }
}
