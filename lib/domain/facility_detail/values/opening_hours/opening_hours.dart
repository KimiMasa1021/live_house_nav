import 'package:freezed_annotation/freezed_annotation.dart';

import '../store_hours/store_hours.dart';
part 'opening_hours.freezed.dart';
part 'opening_hours.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class OpeingHours with _$OpeingHours {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory OpeingHours({
    @Default(false) bool openNow,
    @Default([]) List<StoreHours> periods,
  }) = _OpeingHours;

  factory OpeingHours.fromJson(Map<String, dynamic> json) =>
      _$OpeingHoursFromJson(json);
}
