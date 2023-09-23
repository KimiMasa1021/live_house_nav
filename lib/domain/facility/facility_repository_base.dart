import 'package:async/async.dart';

import '../text_search/live_house_suggests.dart';
import 'value/facility/facility.dart';

abstract class FacilityRepositoryBase {
  Future<Result<LiveHoueSuggests>> fetchLiveHoueFromText(Uri uri);
  Future<List<Facility>> featchFacilityFromType(String facilityType);
  Future<List<Facility>> featchNextItems(
    String facilityType,
  );
  Future<List<Facility>> featchNewFacility();
}
