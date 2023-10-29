import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/spotify/token/spotify_token_service.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/state/artists.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/spotify/artists/spotify_artists_service.dart';

final searchArtistsNotifierProvider =
    AsyncNotifierProvider<SearchArtistsNotifier, Artists>(
  () => SearchArtistsNotifier(),
);

class SearchArtistsNotifier extends AsyncNotifier<Artists> {
  late SharedPreferences prefs;
  @override
  FutureOr<Artists> build() async {
    prefs = await SharedPreferences.getInstance();
    await ref.watch(spotifyTokenServiceProvider).initToken();
    return Artists();
  }

  Future<void> fetchArtists(String query) async {
    final result =
        await ref.read(spotifyArtistsServiceProvider).getArtists(query);
    if (result == null) {
      state = AsyncValue.error("", StackTrace.current);
    } else {
      state = AsyncValue.data(result);
    }
  }

  Future<void> clearState() async {
    state = AsyncValue.data(Artists());
  }
}
