import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/live_house_list/value/business_hour/business_hour.dart';
part 'store_hours.freezed.dart';
part 'store_hours.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class StoreHours with _$StoreHours {
  factory StoreHours({
    required BusinessHour open,
    required BusinessHour close,
  }) = _StoreHours;

  factory StoreHours.fromJson(Map<String, dynamic> json) =>
      _$StoreHoursFromJson(json);
}
