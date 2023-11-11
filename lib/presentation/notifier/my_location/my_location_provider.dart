import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'my_location_provider.g.dart';

@riverpod
Future<Position> featchMyLocation(FeatchMyLocationRef ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  final defaultPosition = Position(
    latitude: 35.661591347436186,
    longitude: 139.66686906030822,
    accuracy: 0,
    timestamp: DateTime.now(),
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return defaultPosition;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return defaultPosition;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return defaultPosition;
  }

  return await Geolocator.getCurrentPosition();
}
