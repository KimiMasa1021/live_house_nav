import 'package:async/src/result/result.dart';

import '../../../presentation/notifier/spotify/search_artists/state/artists.dart';

abstract class SpotifiyArtistsRepositoryBase {
  Future<Result<Artists>> getArtists(String query);
}
