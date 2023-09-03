import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house/value/live_house/live_house.dart';
import '../../domain/live_house/live_house_repository_base.dart';
import '../../domain/text_search/live_house_suggests.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

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

  final headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  @override
  Future<Result<LiveHoueSuggests>> fetchLiveHoueFromText(Uri uri) async {
    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode != 200) {
        return Result.error("");
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;

        final result = LiveHoueSuggests.fromJson(jsonResult);

        return Result.value(result);
      }
    } catch (_) {
      return Result.error("");
    }
  }

  @override
  Future<List<LiveHouse>> featchLiveHouseFromQuery(
    List<String> prefectureValue,
  ) async {
    final CollectionReference<LiveHouse> collectionReference = _db
        .collection('liveHouses')
        .withConverter<LiveHouse>(
          fromFirestore: (snapshot, _) => LiveHouse.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    final querySnapshot = prefectureValue.isNotEmpty
        ? await collectionReference
            .where("prefectureValue", whereIn: prefectureValue)
            .get()
        : await collectionReference.get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }
}
