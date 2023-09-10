import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/live_house/live_house_repository.dart';

import '../text_search/live_house_suggests.dart';
import 'value/live_house/live_house.dart';

final liveHouseServiceProvider = Provider(
  (ref) => LiveHouseService(
    ref.read(lveHouseRepository),
  ),
);

class LiveHouseService {
  LiveHouseService(LiveHouseRepository liveHouseRepository)
      : _liveHouseRepository = liveHouseRepository;

  final LiveHouseRepository _liveHouseRepository;

  Stream<List<DocumentSnapshot<LiveHouse>>> subscribeQueryLiveHouseList(
    String queryString,
  ) {
    return _liveHouseRepository.subscribeQueryLiveHouseList(queryString);
  }

  Future<LiveHoueSuggests> fetchLiveHouseFromText(Uri uri) async {
    final result = await _liveHouseRepository.fetchLiveHoueFromText(uri);

    if (result.isError) return LiveHoueSuggests();
    return await result.asFuture.then((value) => value);
  }

  Future<List<LiveHouse>> featchLiveHouseFromQuery() {
    return _liveHouseRepository.featchLiveHouseFromQuery(
      [],
    );
  }
}
