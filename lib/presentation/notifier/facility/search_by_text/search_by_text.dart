import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/facility/facility_service.dart';
import '../../../../domain/text_search/live_house_suggests.dart';

final searchByTextNotifierProvider =
    StateNotifierProvider.autoDispose<SearchByTextNotifier, LiveHoueSuggests>(
  (ref) => SearchByTextNotifier(
    ref,
    liveHouseService: ref.read(facilityServiceProvider),
  ),
);

class SearchByTextNotifier extends StateNotifier<LiveHoueSuggests> {
  SearchByTextNotifier(this.ref, {required FacilityService liveHouseService})
      : _liveHouseService = liveHouseService,
        super(LiveHoueSuggests());
  final Ref ref;
  final baseUrl =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/json";
  final FacilityService _liveHouseService;
  final apiKey = dotenv.get('GOOGLE_API_KEY');

  Future<void> searchLiveHoue(String searchText) async {
    final Uri uri = Uri.parse(
        "$baseUrl?fields=name,place_id&input=ライブハウス,$searchText&inputtype=textquery&key=$apiKey");
    final result = await _liveHouseService.fetchLiveHouseFromText(uri);

    state = result;
  }

  void clearState() {
    state = state.copyWith(candidates: []);
  }
}
