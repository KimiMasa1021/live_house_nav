import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/facility/facility_service.dart';
import '../../../../domain/facility/value/facility/facility.dart';

final newFacilityNotifierProvider =
    AsyncNotifierProvider<NewFacilityNotifier, List<Facility>>(
  () => NewFacilityNotifier(),
);

class NewFacilityNotifier extends AsyncNotifier<List<Facility>> {
  @override
  FutureOr<List<Facility>> build() {
    return fetchNewFacility();
  }

  Future<List<Facility>> fetchNewFacility() async {
    final result = await ref.read(facilityServiceProvider).fetchNewFacility();

    return result;
  }
}
