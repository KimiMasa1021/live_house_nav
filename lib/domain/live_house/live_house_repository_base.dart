import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_house_nav/domain/live_house/value/live_house/live_house.dart';
import 'package:async/async.dart';

import '../text_search/live_house_suggests.dart';

abstract class LiveHouseRepositoryBase {
  Stream<List<DocumentSnapshot<LiveHouse>>> subscribeQueryLiveHouseList(
    String queryString,
  );
  Future<Result<LiveHoueSuggests>> fetchLiveHoueFromText(Uri uri);
  Future<List<LiveHouse>> featchLiveHouseFromQuery(
    List<String> prefectureValue,
  );
}
