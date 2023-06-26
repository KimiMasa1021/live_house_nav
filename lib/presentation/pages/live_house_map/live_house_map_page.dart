import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/presentation/notifier/map/map_notifier.dart';
import 'package:live_house_nav/presentation/notifier/my_location/my_location_provider.dart';

import '../../../common/text_theme/text_theme.dart';
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
    final textTheme = ref.watch(myTextThemeProvider);

    return Scaffold(
      body: myLocation.when(
        data: (location) {
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    location.latitude,
                    location.longitude,
                  ),
                  zoom: 21,
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
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: HexColor("131313"),
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        color: HexColor("4B4B4B"),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "エリア・施設名・キーワード",
                            style: textTheme.fs16.copyWith(
                              color: HexColor("757575"),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 45,
                          decoration: BoxDecoration(
                            color: HexColor("242424"),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(45),
                              bottomRight: Radius.circular(45),
                            ),
                            border: Border.all(
                              color: HexColor("4B4B4B"),
                            ),
                          ),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: HexColor("EFEFEF"),
                          ),
                        ),
                      ],
                    ),
                  ),
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
