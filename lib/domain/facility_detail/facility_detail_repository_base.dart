import 'package:async/src/result/result.dart';

import 'values/facility_detail/facility_detail.dart';

abstract class FacilityDetailRepositoryBase {
  Future<Result<FacilityDetail>> featchLiveHouseDetail(Uri uri);
}
