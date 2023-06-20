import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Photo with _$Photo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Photo({
    @Default(0) int height,
    @Default(0) int width,
    @Default("") String photoReference,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
