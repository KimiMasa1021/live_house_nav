import 'dart:convert';
import 'dart:io';
import 'package:async/src/result/result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/state/artists.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'spotify_artists_repository_base.dart';

final spotifiyArtistsRepositoryProvider =
    Provider((ref) => SpotifiyArtistsRepository());

class SpotifiyArtistsRepository implements SpotifiyArtistsRepositoryBase {
  late HttpClient client;
  late IOClient http;
  SpotifiyArtistsRepository() {
    client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http = IOClient(client);
  }

  @override
  Future<Result<Artists>> getArtists(String query) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final uri = Uri.parse(
          "https://api.spotify.com/v1/search?q=$query&type=artist&locale=ja-JP");
      final accsesToken = prefs.getString('accsesToken');
      final headers = {
        'Authorization': 'Bearer $accsesToken',
        "Accept-Language": "jp",
        "q": "1",
      };
      final response = await http.get(uri, headers: headers);
      if (response.statusCode != 200) {
        debugPrint(response.body);
        return Result.error(response.body);
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;
        final result = Artists.fromJson(jsonResult["artists"]);
        return Result.value(result);
      }
    } catch (e) {
      return Result.error(e);
    }
  }
}
