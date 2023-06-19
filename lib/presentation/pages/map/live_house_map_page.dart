import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/presentation/notifier/live_house/live_house_notifier.dart';
import 'package:live_house_nav/presentation/notifier/my_location/my_location_provider.dart';

class LiveHouseMapPage extends HookConsumerWidget {
  const LiveHouseMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveHouseNotifier = ref.watch(liveHouseNotifierProvider);
    final myLocation = ref.watch(featchMyLocationProvider);
    final size = MediaQuery.of(context).size;
    final pageController = PageController(
      viewportFraction: 0.9,
    );
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
                onMapCreated: (GoogleMapController controller) {},
              ),
              liveHouseNotifier.when(
                data: (liveHoue) {
                  return Align(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      width: size.width,
                      height: 140,
                      margin: EdgeInsets.only(bottom: 15),
                      child: PageView(
                        controller: pageController,
                        children: liveHoue.results.results.map(
                          (house) {
                            return Container(
                              width: size.width,
                              height: 140,
                              margin: EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 100,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            house.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  );
                },
                error: (e, s) {
                  return const SizedBox();
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
