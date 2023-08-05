import 'package:live_house_nav/domain/live_house_detail/live_house_detail_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/live_house_detail/values/live_house_detail/live_house_detail.dart';
part 'live_houe_detail_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<LiveHouseDetail> featchLiveHouseDetail(
  FeatchLiveHouseDetailRef ref, {
  required String priceId,
}) async {
  const basePlaceApiUrl =
      "https://maps.googleapis.com/maps/api/place/details/json?";
  const baseImageRefApiUrl =
      "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&";
  const apiKey = "AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M";

  final Uri detailApiUri = Uri.parse(
      "${basePlaceApiUrl}place_id=$priceId&fields=name,photo,website,international_phone_number,formatted_phone_number,opening_hours,geometry,vicinity&key=$apiKey");
  final _liveHouseDetailService = ref.watch(liveHouseDetailService);
  final result =
      await _liveHouseDetailService.featchLiveHouseDetail(detailApiUri);
  List<String> imageList = result.photos.map((e) {
    return "${baseImageRefApiUrl}photo_reference=${e.photoReference}&key=$apiKey";
  }).toList();

  return result.copyWith(imageList: imageList);
}
