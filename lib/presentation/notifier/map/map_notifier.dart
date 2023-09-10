import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/live_house/value/live_house/live_house.dart';
import '../../pages/live_house_map/status/live_house_map.dart';
part 'map_notifier.g.dart';

@Riverpod(keepAlive: true)
class MapNotifier extends _$MapNotifier {
  @override
  LiveHouseMap build() => LiveHouseMap();

  Future<void> onMapCreated(GoogleMapController mapController) async {
    final googleMapStyle =
        await rootBundle.loadString('assets/jsons/google_map_style.json');
    await mapController.setMapStyle(googleMapStyle);
    state = state.copyWith(controller: mapController);
  }

  Future<void> setCamera(List<LiveHouse> testList) async {
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
