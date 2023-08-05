import 'package:freezed_annotation/freezed_annotation.dart';
import '../opening_hours/opening_hours.dart';
import '../photo/photo.dart';
part 'live_house_detail.freezed.dart';
part 'live_house_detail.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHouseDetail with _$LiveHouseDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory LiveHouseDetail({
    @Default("") String name,
    @Default("") String vicinity,
    @Default("") String formattedPhoneNumber,
    @Default("") String internationalPhoneNumber,
    @Default("") String website,
    @Default([]) List<Photo> photos,
    @Default([]) List<String> imageList,
    OpeingHours? openingHours,
  }) = _LiveHouseDetail;

  factory LiveHouseDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseDetailFromJson(json);
}
