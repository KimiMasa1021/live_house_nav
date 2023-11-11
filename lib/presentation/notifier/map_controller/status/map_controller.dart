import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'map_controller.freezed.dart';

@freezed
class MapController with _$MapController {
  factory MapController({
    @Default(null) GoogleMapController? controller,
    @Default(false) bool isCameraMoved,
    @Default(null) LatLng? previousLatLng,
    @Default(null) LatLng? latLng,
    @Default(10.0) double radiusInKm,
    @Default(10.0) double previousRadiusInKm,
    @Default("") String markerId,
  }) = _MapController;
}
