import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/facility/facility_service.dart';
import '../../../domain/text_search/live_house_suggests.dart';

final textSearchNotifierProvider =
    StateNotifierProvider.autoDispose<TextSearchNotifier, LiveHoueSuggests>(
  (ref) => TextSearchNotifier(
    ref,
    liveHouseService: ref.read(facilityServiceProvider),
  ),
);

class TextSearchNotifier extends StateNotifier<LiveHoueSuggests> {
  TextSearchNotifier(this.ref, {required FacilityService liveHouseService})
      : _liveHouseService = liveHouseService,
        super(LiveHoueSuggests());
  final Ref ref;
  final baseUrl =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
  final FacilityService _liveHouseService;
  Future<void> searchLiveHoue(String searchText) async {
    final Uri uri = Uri.parse(
        "$baseUrl?fields=name,place_id&input=ライブハウス,$searchText&inputtype=textquery&key=AIzaSyDzB3j0TAQolKL9K-C_jqFQD6i3I_CHs9M");
    final result = await _liveHouseService.fetchLiveHouseFromText(uri);

    state = result;
  }

  void clearState() {
    state = state.copyWith(candidates: []);
  }
}
