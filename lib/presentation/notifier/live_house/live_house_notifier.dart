import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house/value/live_house/live_house.dart';

final _stream = StreamController<List<LiveHouse>>();
final _db = FirebaseFirestore.instance;

class GeoQueryCondition {
  GeoQueryCondition({
    required this.radiusInKm,
    required this.cameraPosition,
  });

  final double radiusInKm;
  final CameraPosition cameraPosition;
}

final livehouseNotifierProvider = StateNotifierProvider.family<
    LiveHouseNotifier, AsyncValue<List<LiveHouse>>, LatLng>(
  (ref, LatLng latLng) => LiveHouseNotifier(
    ref,
    initialPosition: latLng,
  ),
);

class LiveHouseNotifier extends StateNotifier<AsyncValue<List<LiveHouse>>> {
  Ref ref;
  final LatLng initialPosition;

  LiveHouseNotifier(this.ref, {required this.initialPosition})
      : super(const AsyncLoading()) {
    Future(() async {
      final result = await featchLiveHouseList(
          GeoPoint(initialPosition.latitude, initialPosition.longitude));
      state = AsyncData(result);
    });
  }

  final CollectionReference<LiveHouse> collectionReference = _db
      .collection('liveHouses')
      .withConverter<LiveHouse>(
        fromFirestore: (snapshot, _) => LiveHouse.fromJson(snapshot.data()!),
        toFirestore: (data, _) => data.toJson(),
      );

  Future<List<LiveHouse>> featchLiveHouseList(GeoPoint point) async {
    final snapshot =
        await GeoCollectionReference(collectionReference).fetchWithin(
      center: GeoFirePoint(point),
      radiusInKm: 50,
      field: 'geo',
      geopointFrom: (data) => data.geo.geopoint,
      strictMode: true,
    );
    return snapshot.map((e) => e.data()!).toList();
  }
}
