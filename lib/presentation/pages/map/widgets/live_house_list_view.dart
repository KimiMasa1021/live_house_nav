import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../notifier/facility/facility_list/facility_notifier.dart';
import '../../../notifier/map_controller/map_controller_notifier.dart';
import 'live_house_panel.dart';

class LiveHouseListView extends HookConsumerWidget {
  const LiveHouseListView({
    super.key,
    required this.pageController,
    required this.location,
  });
  final PageController pageController;
  final Position location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final newMethodsLive = ref.watch(facilityNotifierProvider(
        LatLng(location.latitude, location.longitude)));
    final mapController = ref.watch(mapControllerNotifierProvider);
    final mapControllerNotifier =
        ref.watch(mapControllerNotifierProvider.notifier);

    return newMethodsLive.when(
      data: (liveHoue) {
        return Align(
          alignment: const Alignment(0, 1),
          child: Container(
            width: size.width,
            height: 120,
            margin: const EdgeInsets.only(bottom: 15),
            child: PageView(
              controller: pageController,
              onPageChanged: (val) async {
                final facility = liveHoue.elementAt(val);
                final geo = facility.geo.geopoint;
                await mapController.controller!.animateCamera(
                  CameraUpdate.newLatLng(
                    LatLng(
                      geo.latitude,
                      geo.longitude,
                    ),
                  ),
                );
                mapControllerNotifier.updateMarkerId(facility.placeId);
              },
              children: liveHoue.map(
                (house) {
                  return LiveHousePanel(
                    liveHouse: house,
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
    );
  }
}
