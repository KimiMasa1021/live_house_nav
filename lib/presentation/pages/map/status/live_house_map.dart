import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'live_house_map.freezed.dart';

@freezed
class LiveHouseMap with _$LiveHouseMap {
  factory LiveHouseMap({
    @Default(null) GoogleMapController? controller,
  }) = _LiveHouseMap;
}
