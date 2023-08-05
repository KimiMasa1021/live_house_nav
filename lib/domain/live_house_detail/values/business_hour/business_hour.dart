import 'package:freezed_annotation/freezed_annotation.dart';
part 'business_hour.freezed.dart';
part 'business_hour.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class BusinessHour with _$BusinessHour {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory BusinessHour({
    @Default(0) int day,
    @Default("") String time,
  }) = _OpeingHours;

  factory BusinessHour.fromJson(Map<String, dynamic> json) =>
      _$BusinessHourFromJson(json);
}
