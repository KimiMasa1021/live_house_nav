import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/live_house_detail/live_house_detail_repository.dart';
import 'values/live_house_detail/live_house_detail.dart';
import 'values/opening_hours/opening_hours.dart';

final liveHouseDetailService = Provider(
  (ref) => LiveHouseDetailService(
    ref.read(lveHouseDetailRepository),
  ),
);

class LiveHouseDetailService {
  LiveHouseDetailService(LiveHouseDetailRepository liveHouseDetailRepository)
      : _liveHouseDetailRepository = liveHouseDetailRepository;

  final LiveHouseDetailRepository _liveHouseDetailRepository;

  Future<LiveHouseDetail> featchLiveHouseDetail(
    Uri uri,
  ) async {
    final result = await _liveHouseDetailRepository.featchLiveHouseDetail(uri);
    if (!result.isError) {
      return await result.asFuture.then((value) {
        return value;
      });
    }
    return LiveHouseDetail(openingHours: OpeingHours());
  }
}
