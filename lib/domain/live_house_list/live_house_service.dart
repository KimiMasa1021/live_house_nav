import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/domain/live_house_list/value/live_house_detail/live_house_detail.dart';
import 'package:live_house_nav/infrastructure/live_house/live_house_repository.dart';

import 'live_house_list.dart';

final liveHouseService = Provider(
  (ref) => LiveHouseService(
    ref.read(lveHouseRepository),
  ),
);

class LiveHouseService {
  LiveHouseService(LiveHouseRepository liveHouseRepository)
      : _liveHouseRepository = liveHouseRepository;

  final LiveHouseRepository _liveHouseRepository;

  Future<LiveHouseList> featchLiveHouseList(
    Uri uri,
  ) async {
    final result = await _liveHouseRepository.featchLiveHouse(uri);
    if (!result.isError) {
      return await result.asFuture.then((value) {
        return value;
      });
    }
    return LiveHouseList();
  }

  Future<LiveHouseDetail> featchLiveHouseDetail(
    Uri uri,
  ) async {
    final result = await _liveHouseRepository.featchLiveHouseDetail(uri);
    if (!result.isError) {
      return await result.asFuture.then((value) {
        return value;
      });
    }
    return LiveHouseDetail();
  }
}
