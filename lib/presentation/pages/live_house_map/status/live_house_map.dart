import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'live_house_map.freezed.dart';

@freezed
class LiveHouseMap with _$LiveHouseMap {
  factory LiveHouseMap({
    @Default(null) GoogleMapController? controller,
    @Default(false) bool isCameraMoved,
    @Default(null) LatLng? previousLatLng,
    @Default(null) LatLng? latLng,
    @Default(10.0) double radiusInKm,
    @Default(10.0) double previousRadiusInKm,
  }) = _LiveHouseMap;
}
