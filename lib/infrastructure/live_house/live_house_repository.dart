import 'dart:convert';
import 'package:async/src/result/result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:live_house_nav/domain/live_house_list/value/live_house_detail/live_house_detail.dart';
import '../../domain/live_house_list/live_house_list.dart';
import '../../domain/live_house_list/live_house_repository_base.dart';

final lveHouseRepository = Provider((ref) => LiveHouseRepository());

class LiveHouseRepository implements LiveHouseRepositoryBase {
  final headers = {'content-type': 'application/json'};
  @override
  Future<Result<LiveHouseList>> featchLiveHouse(Uri uri) async {
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint("featchLiveHouse : ${response.statusCode}");
      if (response.statusCode != 200) {
        return Result.error("");
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;
        final model = LiveHouseList.fromJson(jsonResult);
        return Result.value(model);
      }
    } catch (_) {
      return Result.error("");
    }
  }

  @override
  Future<Result<LiveHouseDetail>> featchLiveHouseDetail(Uri uri) async {
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint("featchLiveHouse : ${response.statusCode}");
      if (response.statusCode != 200) {
        return Result.error("");
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;
        final model = LiveHouseDetail.fromJson(jsonResult["result"]);
        return Result.value(model);
      }
    } catch (_) {
      return Result.error("");
    }
  }
}
