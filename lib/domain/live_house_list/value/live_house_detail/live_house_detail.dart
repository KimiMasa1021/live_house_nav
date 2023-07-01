import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/opening_hours/opening_hours.dart';
import 'package:live_house_nav/domain/live_house_list/value/photo/photo.dart';
part 'live_house_detail.freezed.dart';
part 'live_house_detail.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHouseDetail with _$LiveHouseDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory LiveHouseDetail({
    @Default("") String formattedPhoneNumber,
    @Default("") String internationalPhoneNumber,
    @Default("") String website,
    @Default([]) List<Photo> photos,
    @Default([]) List<String> imageList,
    required OpeingHours openingHours,
  }) = _LiveHouseDetail;

  factory LiveHouseDetail.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseDetailFromJson(json);
}
