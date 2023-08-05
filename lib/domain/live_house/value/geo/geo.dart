import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_point_converter.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Geo with _$Geo {
  factory Geo({
    @Default("") String geohash,
    @GeoPointConverter() required GeoPoint geopoint,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
