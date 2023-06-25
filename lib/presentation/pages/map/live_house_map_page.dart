import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/presentation/notifier/map/map_notifier.dart';
import 'package:live_house_nav/presentation/notifier/my_location/my_location_provider.dart';

import '../../notifier/live_house/live_house_notifier.dart';
import 'widgets/live_house_list_view.dart';

class LiveHouseMapPage extends HookConsumerWidget {
  const LiveHouseMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLocation = ref.watch(featchMyLocationProvider);
    final pageController = PageController(
      viewportFraction: 0.9,
    );
    final liveHouse = ref.watch(liveHouseNotifierProvider);
    final liveHouseMap = ref.watch(mapNotifierProvider);
    final mapNotifierCTL = ref.watch(mapNotifierProvider.notifier);

    return Scaffold(
      body: myLocation.when(
        data: (location) {
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    location.latitude,
                    location.longitude,
                  ),
                  zoom: 19,
                ),
                onCameraMoveStarted: () => mapNotifierCTL.onCameraMove(),
                markers: liveHouse.when(
                  data: (data) => data.results
                      .map(
                        (e) => Marker(
                          markerId: MarkerId(e.placeId),
                          position: LatLng(
                            e.geometry.location.lat,
                            e.geometry.location.lng,
                          ),
                        ),
                      )
                      .toSet(),
                  error: (e, s) => {},
                  loading: () => {},
                ),
                onMapCreated: (controller) async =>
                    await mapNotifierCTL.onMapCreated(controller),
              ),
              Align(
                alignment: const Alignment(0, -1),
                child: SafeArea(
                  child: liveHouseMap.isCameraMoved
                      ? const Text("このエリアで再検索")
                      : const SizedBox(),
                ),
              ),
              LiveHouseListView(
                pageController: pageController,
              ),
            ],
          );
        },
        error: (e, s) {
          return const Center(
            child: Text("エラー"),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
