import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../pages/map/status/live_house_map.dart';
part 'map_notifier.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  Future<LiveHouseMap> build() async {
    return LiveHouseMap();
  }

  Future<void> onMapCreated(GoogleMapController mapController) async {
    state = AsyncValue.data(
      LiveHouseMap(
        controller: mapController,
      ),
    );
  }
}
