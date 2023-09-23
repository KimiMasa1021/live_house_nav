import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/facility_detail/facility_detail_repository.dart';
import 'values/facility_detail/facility_detail.dart';
import 'values/opening_hours/opening_hours.dart';

final facilityDetailService = Provider(
  (ref) => FacilityDetailService(
    ref.read(facilityDetailRepository),
  ),
);

class FacilityDetailService {
  FacilityDetailService(FacilityDetailRepository liveHouseDetailRepository)
      : _liveHouseDetailRepository = liveHouseDetailRepository;

  final FacilityDetailRepository _liveHouseDetailRepository;

  Future<FacilityDetail> featchLiveHouseDetail(
    Uri uri,
  ) async {
    final result = await _liveHouseDetailRepository.featchLiveHouseDetail(uri);
    if (!result.isError) {
      return await result.asFuture.then((value) {
        return value;
      });
    }
    return FacilityDetail(openingHours: OpeingHours());
  }
}
