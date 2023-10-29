import 'dart:convert';
import 'dart:io';
import 'package:async/src/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';
import '../../domain/facility_detail/facility_detail_repository_base.dart';
import '../../domain/facility_detail/values/facility_detail/facility_detail.dart';

final facilityDetailRepository = Provider((ref) => FacilityDetailRepository());

class FacilityDetailRepository implements FacilityDetailRepositoryBase {
  late HttpClient client;
  late IOClient http;
  FacilityDetailRepository() {
    client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    http = IOClient(client);
  }

  final headers = {'content-type': 'application/json'};

  @override
  Future<Result<FacilityDetail>> featchLiveHouseDetail(Uri uri) async {
    try {
      final response = await http.get(uri, headers: headers);
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
