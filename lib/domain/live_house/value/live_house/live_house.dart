import 'package:freezed_annotation/freezed_annotation.dart';

import '../geo/geo.dart';
part 'live_house.freezed.dart';
part 'live_house.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHouse with _$LiveHouse {
  factory LiveHouse({
    @Default("") String placeId,
    @Default("") String name,
    @Default("") String vicinity,
    @Default("") String imageUrl,
    required Geo geo,
  }) = _LiveHouse;

  factory LiveHouse.fromJson(Map<String, dynamic> json) =>
      _$LiveHouseFromJson(json);
}
