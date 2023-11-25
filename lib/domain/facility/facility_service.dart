import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/facility/facility_repository.dart';

import '../text_search/live_house_suggests.dart';
import 'value/facility/facility.dart';

final facilityServiceProvider = Provider(
  (ref) => FacilityService(
    ref.watch(facilityRepository),
  ),
);

class FacilityService {
  FacilityService(FacilityRepository liveHouseRepository)
      : _liveHouseRepository = liveHouseRepository;

  final FacilityRepository _liveHouseRepository;

  Future<LiveHoueSuggests> fetchLiveHouseFromText(Uri uri) async {
    final result = await _liveHouseRepository.fetchLiveHoueFromText(uri);

    if (result.isError) return LiveHoueSuggests();
    return await result.asFuture.then((value) => value);
  }

  Future<List<Facility>> featchFacilityFromType(
    String facilityType,
  ) async {
    return await _liveHouseRepository.featchFacilityFromType(facilityType);
  }

  Future<List<Facility>> fetchNextItems(
    String facilityType,
  ) async {
    return await _liveHouseRepository.featchNextItems(facilityType);
  }

  Future<List<Facility>> fetchNewFacility() async {
    return await _liveHouseRepository.featchNewFacility();
  }
}
