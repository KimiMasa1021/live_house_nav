import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/facility/facility_repository_base.dart';
import '../../domain/facility/value/facility/facility.dart';
import '../../domain/text_search/live_house_suggests.dart';
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'package:http/io_client.dart';

final facilityRepository = Provider((ref) => FacilityRepository());

class FacilityRepository implements FacilityRepositoryBase {
  late HttpClient client;
  late IOClient http;
  FacilityRepository() {
    client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http = IOClient(client);
  }
  final _db = FirebaseFirestore.instance;
  QueryDocumentSnapshot<Facility>? lastItem;

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
  Future<List<Facility>> featchFacilityFromType(
    String facilityType,
  ) async {
    final CollectionReference<Facility> collectionReference = _db
        .collection('liveHouses')
        .withConverter<Facility>(
          fromFirestore: (snapshot, _) => Facility.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    final querySnapshot = await collectionReference
        .where("facilityType", arrayContains: facilityType)
        .orderBy("createdAt")
        .limit(10)
        .get();
    if (querySnapshot.docs.isNotEmpty) lastItem = querySnapshot.docs.last;

    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Future<List<Facility>> featchNextItems(
    String facilityType,
  ) async {
    final CollectionReference<Facility> collectionReference = _db
        .collection('liveHouses')
        .withConverter<Facility>(
          fromFirestore: (snapshot, _) => Facility.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastItem == null) return [];

    final querySnapshot = await collectionReference
        .where("facilityType", arrayContains: facilityType)
        .orderBy("createdAt")
        .startAfterDocument(lastItem!)
        .limit(10)
        .get();
    if (querySnapshot.docs.isNotEmpty) lastItem = querySnapshot.docs.last;

    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Future<List<Facility>> featchNewFacility() async {
    final CollectionReference<Facility> collectionReference = _db
        .collection('liveHouses')
        .withConverter<Facility>(
          fromFirestore: (snapshot, _) => Facility.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    final querySnapshot =
        await collectionReference.orderBy("createdAt").limit(10).get();

    return querySnapshot.docs.map((e) => e.data()).toList();
  }
}
