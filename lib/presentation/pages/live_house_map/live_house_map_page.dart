import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/presentation/notifier/map/map_notifier.dart';
import 'package:live_house_nav/presentation/notifier/my_location/my_location_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../notifier/live_house/live_house_notifier.dart';
import 'widgets/live_house_list_view.dart';
import 'package:intl/intl.dart';

class LiveHouseMapPage extends HookConsumerWidget {
  const LiveHouseMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLocation = ref.watch(featchMyLocationProvider);
    final pageController = PageController(
      viewportFraction: 0.9,
    );
    final size = MediaQuery.of(context).size;

    final liveHouseMap = ref.watch(mapNotifierProvider);
    final mapNotifierCTL = ref.watch(mapNotifierProvider.notifier);
    final textTheme = ref.watch(myTextThemeProvider);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );
    final tweenAnimation =
        Tween(begin: 56.0, end: size.height / 2).animate(animationController);

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
                          onTap: () {
                            final index =
                                data.indexWhere((facility) => facility == e);
                            pageController.jumpToPage(index);
                          },
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
                circles: {
                  Circle(
                    circleId: const CircleId("1"),
                    center: liveHouseMap.previousLatLng != null
                        ? liveHouseMap.previousLatLng!
                        : LatLng(
                            location.latitude,
                            location.longitude,
                          ),
                    radius: liveHouseMap.previousRadiusInKm * 1000,
                    strokeColor: Colors.black,
                    fillColor: Colors.black.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                  liveHouseMap.isCameraMoved
                      ? Circle(
                          circleId: const CircleId("2"),
                          center: liveHouseMap.latLng!,
                          radius: liveHouseMap.radiusInKm * 1000,
                          strokeColor: Colors.blue,
                          strokeWidth: 1,
                        )
                      : const Circle(
                          circleId: CircleId(""),
                        ),
                },
                onMapCreated: (controller) async =>
                    await mapNotifierCTL.onMapCreated(controller),
              ),
              LiveHouseListView(
                pageController: pageController,
                location: location,
              ),
              liveHouseMap.isCameraMoved
                  ? Align(
                      alignment: const Alignment(1, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 150, right: 25),
                        child: FloatingActionButton(
                          onPressed: () async {
                            await newMethodsLiveCTL.test(liveHouseMap.latLng!);
                          },
                          backgroundColor: HexColor("131313"),
                          child:
                              const Icon(Icons.youtube_searched_for_outlined),
                        ),
                      ),
                    )
                  : const SizedBox(),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    SizedBox(
                      height: tweenAnimation.value,
                      child: FloatingActionButton(
                        backgroundColor: HexColor("131313"),
                        onPressed: () {
                          if (animationController.isCompleted) {
                            animationController.reverse();
                          } else {
                            animationController.forward();
                          }
                        },
                        child: animationController.isCompleted
                            ? Column(
                                children: [
                                  const SizedBox(height: 15),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: liveHouseMap.radiusInKm
                                              .ceil()
                                              .toString(),
                                          style: textTheme.fs24.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: 'km',
                                          style: textTheme.fs12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SfSlider.vertical(
                                      value: liveHouseMap.radiusInKm,
                                      max: 15,
                                      min: 1,
                                      interval: 9,
                                      minorTicksPerInterval: 1,
                                      showDividers: true,
                                      numberFormat: NumberFormat('#km'),
                                      onChanged: (val) {
                                        mapNotifierCTL.setRadiusInKm(val);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : const Icon(
                                Icons.share_location,
                                size: 35,
                              ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    animationController.isCompleted
                        ? FloatingActionButton(
                            backgroundColor: HexColor("131313"),
                            child: const Icon(Icons.close),
                            onPressed: () {
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            },
                          )
                        : const SizedBox(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
