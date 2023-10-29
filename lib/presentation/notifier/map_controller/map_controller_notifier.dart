import 'dart:math';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/facility/value/facility/facility.dart';
import 'status/map_controller.dart';
part 'map_controller_notifier.g.dart';

@Riverpod(keepAlive: true)
class MapControllerNotifier extends _$MapControllerNotifier {
  @override
  MapController build() => MapController();

  Future<void> onMapCreated(GoogleMapController mapController) async {
    final googleMapStyle =
        await rootBundle.loadString(Assets.jsons.googleMapStyle);
    await mapController.setMapStyle(googleMapStyle);
    state = state.copyWith(controller: mapController);
  }

  Future<void> setCamera(List<Facility> testList) async {
    if (testList.isEmpty) return;
    final double north =
        testList.map((e) => e.geo.geopoint.latitude).reduce(max);
    final double south =
        testList.map((e) => e.geo.geopoint.latitude).reduce(min);
    final double east =
        testList.map((e) => e.geo.geopoint.longitude).reduce(max);
    final double west =
        testList.map((e) => e.geo.geopoint.longitude).reduce(min);

    await state.controller!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(south, west),
          northeast: LatLng(north, east),
        ),
        60,
      ),
    );
    state = state.copyWith(isCameraMoved: false);
  }

  void onCameraMoveStarted() {
    state = state.copyWith(isCameraMoved: true);
  }

  void onCameraMove(LatLng latLng) {
    state = state.copyWith(latLng: latLng);
  }

  void setPreviousValue(
    LatLng latLng,
    double radiusInKm,
  ) {
    state = state.copyWith(
      previousLatLng: latLng,
      previousRadiusInKm: radiusInKm,
    );
  }

  void setRadiusInKm(double radiusInKm) {
    state = state.copyWith(radiusInKm: radiusInKm);
  }
}
