import 'dart:convert';
import 'package:async/src/result/result.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../domain/facility_detail/facility_detail_repository_base.dart';
import '../../domain/facility_detail/values/facility_detail/facility_detail.dart';

final facilityDetailRepository = Provider((ref) => FacilityDetailRepository());

class FacilityDetailRepository implements FacilityDetailRepositoryBase {
  final headers = {'content-type': 'application/json'};

  @override
  Future<Result<FacilityDetail>> featchLiveHouseDetail(Uri uri) async {
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint("featchLiveHouse : ${response.statusCode}");
      if (response.statusCode != 200) {
        return Result.error("");
      } else {
        final jsonResult = jsonDecode(response.body) as Map<String, dynamic>;

        final model = FacilityDetail.fromJson(jsonResult["result"]);

        return Result.value(model);
      }
    } catch (_) {
      return Result.error("");
    }
  }
}
