import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/presentation/notifier/map/map_notifier.dart';
import 'package:live_house_nav/presentation/notifier/my_location/my_location_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../notifier/live_house/live_house_notifier.dart';
import 'widgets/live_house_list_view.dart';
import '../search/widgets/live_house_search_bar.dart';

class LiveHouseMapPage extends HookConsumerWidget {
  const LiveHouseMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLocation = ref.watch(featchMyLocationProvider);
    final pageController = PageController(
      viewportFraction: 0.9,
    );
    // final liveHouse = ref.watch(liveHouseNotifierProvider);
    // final liveHouseCTL = ref.watch(liveHouseNotifierProvider.notifier);

    final liveHouseMap = ref.watch(mapNotifierProvider);
    final mapNotifierCTL = ref.watch(mapNotifierProvider.notifier);
    final textTheme = ref.watch(myTextThemeProvider);

    return Scaffold(
      body: myLocation.when(
        data: (location) {
          final newMethodsLive = ref.watch(livehouseNotifierProvider(
              LatLng(location.latitude, location.longitude)));
          final newMethodsLiveCTL = ref.watch(livehouseNotifierProvider(
                  LatLng(location.latitude, location.longitude))
              .notifier);
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
                onCameraMove: (position) {
                  mapNotifierCTL.onCameraMove(position.target);
                },
                onCameraMoveStarted: () => mapNotifierCTL.onCameraMoveStarted(),
                markers: newMethodsLive.when(
                  data: (data) => data
                      .map(
                        (e) => Marker(
                          markerId: MarkerId(e.placeId),
                          position: LatLng(
                            e.geo.geopoint.latitude,
                            e.geo.geopoint.longitude,
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
              // const LiveHouseSearchBar(),
              LiveHouseListView(
                pageController: pageController,
                location: location,
              ),
              // liveHouseMap.isCameraMoved
              //     ? Align(
              //         alignment: const Alignment(-1, 1),
              //         child: InkWell(
              //           onTap: () async {
              //             debugPrint(liveHouseMap.latLng.toString());
              //             // await liveHouseCTL
              //             //     .featchLiveHouse(liveHouseMap.latLng!);
              //           },
              //           child: Container(
              //             height: 50,
              //             margin: const EdgeInsets.only(bottom: 190, left: 15),
              //             decoration: BoxDecoration(
              //               color: HexColor("131313"),
              //               borderRadius: BorderRadius.circular(45),
              //               border: Border.all(
              //                 color: HexColor("4B4B4B"),
              //               ),
              //             ),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Padding(
              //                   padding:
              //                       const EdgeInsets.symmetric(horizontal: 10),
              //                   child: Text(
              //                     "このエリアで再検索",
              //                     style: textTheme.fs15.copyWith(
              //                       color: HexColor("FFFFFF"),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     : const SizedBox(),
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
