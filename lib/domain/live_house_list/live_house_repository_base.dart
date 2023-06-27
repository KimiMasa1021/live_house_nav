import 'package:async/src/result/result.dart';
import 'package:live_house_nav/domain/live_house_list/value/live_house_detail/live_house_detail.dart';
import 'live_house_list.dart';

abstract class LiveHouseRepositoryBase {
  Future<Result<LiveHouseList>> featchLiveHouse(Uri uri);
  Future<Result<LiveHouseDetail>> featchLiveHouseDetail(Uri uri);
}
