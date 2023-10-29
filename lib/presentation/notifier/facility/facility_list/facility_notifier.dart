import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/facility/value/facility/facility.dart';
import 'package:live_house_nav/presentation/notifier/map_controller/map_controller_notifier.dart';

final _db = FirebaseFirestore.instance;

final facilityNotifierProvider =
    AsyncNotifierProviderFamily<FacilityNotifier, List<Facility>, LatLng>(
  () => FacilityNotifier(),
);

class FacilityNotifier extends FamilyAsyncNotifier<List<Facility>, LatLng> {
  @override
  FutureOr<List<Facility>> build(LatLng arg) async {
    return await test(arg);
  }

  Future<List<Facility>> test(LatLng latLng) async {
    final result = await featchLiveHouseList(
      GeoPoint(
        latLng.latitude,
        latLng.longitude,
      ),
    );

    final mapNotifier = ref.read(mapControllerNotifierProvider.notifier);

    await mapNotifier.setCamera(result);
    state = AsyncValue.data(result);
    return result;
  }

  final CollectionReference<Facility> collectionReference =
      _db.collection('liveHouses').withConverter<Facility>(
            fromFirestore: (snapshot, _) => Facility.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  Future<List<Facility>> featchLiveHouseList(GeoPoint point) async {
    final mapNotifier = ref.read(mapControllerNotifierProvider);

    final snapshot =
        await GeoCollectionReference(collectionReference).fetchWithin(
      center: GeoFirePoint(point),
      radiusInKm: mapNotifier.radiusInKm,
      field: 'geo',
      geopointFrom: (data) => data.geo.geopoint,
      strictMode: true,
    );
    return snapshot.map((e) => e.data()!).toList();
  }
}
