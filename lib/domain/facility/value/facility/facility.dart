import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../geo/geo.dart';
part 'facility.freezed.dart';
part 'facility.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Facility with _$Facility {
  factory Facility({
    @Default("") String placeId,
    @Default("") String name,
    @Default("") String vicinity,
    @Default("") String imageUrl,
    @Default(0.0) double distance,
    @Default("") String prefectureValue,
    @Default([]) List<String> facilityType,
    @Default(null) BitmapDescriptor? marker,
    @Default(null) BitmapDescriptor? activeMarker,
    required Geo geo,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
}
