import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/location/location.dart';

part 'geometry.freezed.dart';
part 'geometry.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Geometry with _$Geometry {
  factory Geometry({
    required Location location,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}
