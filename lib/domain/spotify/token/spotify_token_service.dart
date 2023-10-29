import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/infrastructure/spotify/token/spotify_token_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final spotifyTokenServiceProvider = Provider(
  (ref) => SpotifyTokenService(ref.read(spotifiyTokenRepository)),
);

class SpotifyTokenService {
  SpotifyTokenService(
    SpotifiyTokenRepository repository,
  ) : _repository = repository;

  final SpotifiyTokenRepository _repository;

  Future<String> getAccessToken() async {
    //apiリクエスト
    final token = await _repository.getAccessToken();
    if (token == null) return "";
    return token;
  }

  Future<void> initToken() async {
    final preferences = await SharedPreferences.getInstance();
    final accsesToken = preferences.getString('accsesToken');
    if (accsesToken == null || accsesToken == "") {
      final token = await getAccessToken();
      await preferences.setString('accsesToken', token);
    }
  }

  Future<void> resetAccessToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('accsesToken');
  }
}
