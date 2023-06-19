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
              liveHouseNotifier.when(data: (liveHoue) {
                return Align(
                  alignment: const Alignment(0, 1),
                  child: Container(
                    width: size.width,
                    height: 140,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              }, error: (e, s) {
                return SizedBox();
              }, loading: () {
                return SizedBox();
              }),
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
