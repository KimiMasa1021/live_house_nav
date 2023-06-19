import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/geometry/geometry.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Photo with _$Photo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Photo({
    required int height,
    required int width,
    required String photoReference,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
