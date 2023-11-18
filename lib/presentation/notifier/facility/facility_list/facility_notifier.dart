import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:live_house_nav/domain/facility/value/facility/facility.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:live_house_nav/presentation/notifier/map_controller/map_controller_notifier.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

final _db = FirebaseFirestore.instance;

final facilityNotifierProvider =
    AsyncNotifierProviderFamily<FacilityNotifier, List<Facility>, LatLng>(
  () => FacilityNotifier(),
);

class FacilityNotifier extends FamilyAsyncNotifier<List<Facility>, LatLng> {
  @override
  FutureOr<List<Facility>> build(LatLng arg) async {
    return await test(arg);
  }

  Future<List<Facility>> test(LatLng latLng) async {
    final result = await featchLiveHouseList(
      GeoPoint(
        latLng.latitude,
        latLng.longitude,
      ),
    );
    final processedValue = await Future.wait(result.map((facility) async {
      final marker = await getMarkerIcon(
        const Size(140, 140),
        facility.imageUrl,
        false,
      );
      final activeMarker = await getMarkerIcon(
        const Size(145, 145),
        facility.imageUrl,
        true,
      );
      final aa = facility.copyWith(
        marker: marker,
        activeMarker: activeMarker,
      );

      return aa;
    }).toList());
    final mapNotifier = ref.read(mapControllerNotifierProvider.notifier);

    await mapNotifier.setCamera(processedValue);
    state = AsyncValue.data(processedValue);
    return processedValue;
  }

  final CollectionReference<Facility> collectionReference =
      _db.collection('liveHouses').withConverter<Facility>(
            fromFirestore: (snapshot, _) => Facility.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  Future<List<Facility>> featchLiveHouseList(GeoPoint point) async {
    final mapNotifier = ref.read(mapControllerNotifierProvider);

    final snapshot =
        await GeoCollectionReference(collectionReference).fetchWithin(
      center: GeoFirePoint(point),
      radiusInKm: mapNotifier.radiusInKm,
      field: 'geo',
      geopointFrom: (data) => data.geo.geopoint,
      strictMode: true,
    );
    return snapshot.map((e) => e.data()!).toList();
  }

  Future<BitmapDescriptor> getMarkerIcon(
    Size size,
    String imagePath,
    bool isActive,
  ) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint shadowPaint = Paint()
      ..color = const Color.fromARGB(255, 9, 247, 255).withAlpha(100);
    const double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    const double borderWidth = 3.0;

    const double imageOffset = shadowWidth + borderWidth;

    if (isActive) {
      canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            topLeft: radius,
            topRight: radius,
            bottomLeft: radius,
            bottomRight: radius,
          ),
          shadowPaint);
    }

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await getImageFromPath(imagePath);
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fill);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  final apiKey = dotenv.get('GOOGLE_API_KEY');

  Future<ui.Image> getImageFromPath(String imagePath) async {
    late Uint8List result;
    if (imagePath != "") {
      final response = await http.get(Uri.parse(imagePath));
      result = response.bodyBytes;
    } else {
      final aaa = await rootBundle.load(Assets.facility.noImage.path);
      result = aaa.buffer.asUint8List();
    }

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(result, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }
}
