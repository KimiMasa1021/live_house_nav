import 'package:async/src/result/result.dart';

import 'values/live_house_detail/live_house_detail.dart';

abstract class LiveHouseDetailRepositoryBase {
  Future<Result<LiveHouseDetail>> featchLiveHouseDetail(Uri uri);
}
