import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/domain/spotify/token/spotify_token_service.dart';
import 'package:live_house_nav/infrastructure/spotify/artists/spotify_artists_repository.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/state/artists.dart';

final spotifyArtistsServiceProvider = Provider(
  (ref) => SpotifyArtistsService(
    ref.watch(spotifiyArtistsRepositoryProvider),
    ref.watch(spotifyTokenServiceProvider),
  ),
);

class SpotifyArtistsService {
  SpotifyArtistsService(
    SpotifiyArtistsRepository repository,
    SpotifyTokenService tokenService,
  )   : _repository = repository,
        _tokenService = tokenService;

  final SpotifiyArtistsRepository _repository;
  final SpotifyTokenService _tokenService;

  Future<Artists?> getArtists(String query) async {
    if (query.isEmpty) query = "ロックバンド";
    final result = await _repository.getArtists(query);
    if (result.isError) {
      await _tokenService.resetAccessToken();
      await _tokenService.initToken();
      final secondResult = await _repository.getArtists(query);
      if (secondResult.isValue) await secondResult.asFuture;
    } else {
      return await result.asFuture;
    }
    return null;
  }
}
