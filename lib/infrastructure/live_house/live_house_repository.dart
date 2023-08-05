import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house/value/live_house/live_house.dart';
import '../../domain/live_house/live_house_repository_base.dart';

final lveHouseRepository = Provider((ref) => LiveHouseRepository());

class LiveHouseRepository implements LiveHouseRepositoryBase {
  final _db = FirebaseFirestore.instance;

  @override
  Stream<List<DocumentSnapshot<LiveHouse>>> subscribeQueryLiveHouseList(
    String queryString,
  ) {
    final CollectionReference<LiveHouse> collectionReference = _db
        .collection('liveHouses')
        .withConverter<LiveHouse>(
          fromFirestore: (snapshot, _) => LiveHouse.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    return collectionReference
        .where("nameOption", arrayContains: queryString)
        .snapshots()
        .map((event) => event.docs);
  }
}
