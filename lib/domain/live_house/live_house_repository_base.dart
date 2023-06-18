import 'package:async/src/result/result.dart';

import '../../presentation/notifier/live_house/live_house_notifier.dart';
import 'live_house_map.dart';

abstract class LiveHouseRepositoryBase {
  Future<Result<LiveHouseList>> featchLiveHouse(Uri uri);
}
