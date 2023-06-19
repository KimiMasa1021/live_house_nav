import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/geometry/geometry.dart';
import 'package:live_house_nav/domain/live_house_list/value/photo/photo.dart';

part 'photos.freezed.dart';
part 'photos.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Photos with _$Photos {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Photos({
    required List<Photo> photos,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
