import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_house_nav/domain/live_house/value/live_house/live_house.dart';

abstract class LiveHouseRepositoryBase {
  Stream<List<DocumentSnapshot<LiveHouse>>> subscribeQueryLiveHouseList(
    String queryString,
  );
}
