import 'package:async/src/result/result.dart';

abstract class SpotifyTokenRepositoryBase {
  Future<String?> getAccessToken();
}
