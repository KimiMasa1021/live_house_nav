import 'package:freezed_annotation/freezed_annotation.dart';
import 'value/live_house/live_house.dart';
part 'live_house_list.freezed.dart';
part 'live_house_list.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHouseList with _$LiveHouseList {
  factory LiveHouseList({
    @Default([]) List<LiveHouse> results,
  }) = _LiveHouseList;

  factory LiveHouseList.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseListFromJson(json);
}
