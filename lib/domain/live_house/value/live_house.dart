import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _LiveHouse;

  factory LiveHouse.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseFromJson(json);
}
