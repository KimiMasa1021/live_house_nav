import 'dart:convert';
import 'package:async/src/result/result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:live_house_nav/infrastructure/spotify/token/spotify_token_repository_base.dart';

final spotifiyTokenRepository = Provider((ref) => SpotifiyTokenRepository());

class SpotifiyTokenRepository implements SpotifyTokenRepositoryBase {
  final headers = {
    'content-type': 'application/x-www-form-urlencoded',
  };
  @override
  Future<String?> getAccessToken() async {
    try {
      final uri = Uri.parse("https://accounts.spotify.com/api/token");
      final response = await http.post(
        uri,
        headers: headers,
        body: {
          "client_id": "b5d9d458a1aa44d3b72dd8f5dd4079a8",
          "client_secret": "041720c3060e4ddabb595e7439d16393",
          "grant_type": "client_credentials",
        },
      );
      if (response.statusCode != 200) {
        debugPrint("エラーだよぉ〜${response.body}");
        return null;
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResult["access_token"];
      }
    } catch (_) {
      return null;
    }
  }
}
