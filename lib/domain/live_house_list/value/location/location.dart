import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Location with _$Location {
  factory Location({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
