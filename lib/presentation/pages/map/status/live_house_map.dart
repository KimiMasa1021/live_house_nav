import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_house_nav/domain/live_house/live_house_list.dart';

part 'live_house_map.freezed.dart';

@freezed
class LiveHouseMap with _$LiveHouseMap {
  factory LiveHouseMap({
    required LiveHouseList results,
    @Default(null) GoogleMapController? controller,
  }) = _LiveHouseMap;
}
