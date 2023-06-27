import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/geometry/geometry.dart';
import 'package:live_house_nav/domain/live_house_list/value/live_house_detail/live_house_detail.dart';
import 'package:live_house_nav/domain/live_house_list/value/photo/photo.dart';

part 'live_house.freezed.dart';
part 'live_house.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHouse with _$LiveHouse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory LiveHouse({
    required String placeId,
    required String name,
    required String vicinity,
    @Default("") String imageUrl,
    required String reference,
    required Geometry geometry,
    @Default([]) List<Photo> photos,
  }) = _LiveHouse;

  factory LiveHouse.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseFromJson(json);
}
