import 'package:freezed_annotation/freezed_annotation.dart';
import '../opening_hours/opening_hours.dart';
import '../photo/photo.dart';
part 'facility_detail.freezed.dart';
part 'facility_detail.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class FacilityDetail with _$FacilityDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory FacilityDetail({
    @Default("") String placeId,
    @Default("") String name,
    @Default("") String vicinity,
    @Default("") String formattedPhoneNumber,
    @Default("") String internationalPhoneNumber,
    @Default("") String website,
    @Default([]) List<Photo> photos,
    @Default([]) List<String> imageList,
    OpeingHours? openingHours,
  }) = _FacilityDetail;

  factory FacilityDetail.fromJson(Map<String, dynamic> json) =>
      _$FacilityDetailFromJson(json);
}
