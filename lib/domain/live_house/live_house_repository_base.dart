import 'package:async/src/result/result.dart';
import 'live_house_list.dart';

abstract class LiveHouseRepositoryBase {
  Future<Result<LiveHouseList>> featchLiveHouse(Uri uri);
}
