import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../notifier/live_house/live_house_notifier.dart';
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
    final newMethodsLive = ref.watch(livehouseNotifierProvider(
        LatLng(location.latitude, location.longitude)));
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
