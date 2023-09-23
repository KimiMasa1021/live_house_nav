import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/facility/facility_service.dart';
import '../../../domain/facility/value/facility/facility.dart';

part 'search_notifier.g.dart';

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<List<Facility>> build(
    String facilityValue,
  ) async {
    final result = await fetchFacility(facilityValue);
    return result;
  }

  Future<List<Facility>> fetchFacility(
    String facilityValue,
  ) async {
    final result = await ref
        .read(facilityServiceProvider)
        .featchFacilityFromType(facilityValue);

    return result;
  }

  Future<void> fetchNextItems() async {
    final result =
        await ref.read(facilityServiceProvider).fetchNextItems(facilityValue);
    debugPrint(result.toString());
    if (result.isNotEmpty) {
      state = AsyncData(
        [...state.value!, ...result],
      );
    }
  }

  final prefectureList = [
    "北海道",
    "青森県",
    "岩手県",
    "宮城県",
    "秋田県",
    "山形県",
    "福島県",
    "茨城県",
    "栃木県",
    "群馬県",
    "埼玉県",
    "千葉県",
    "東京都",
    "神奈川県",
    "新潟県",
    "山梨県",
    "長野県",
    "富山県",
    "石川県",
    "福井県",
    "岐阜県",
    "静岡県",
    "愛知県",
    "三重県",
    "滋賀県",
    "京都府",
    "大阪府",
    "兵庫県",
    "奈良県",
    "和歌山県",
    "鳥取県",
    "島根県",
    "岡山県",
    "広島県",
    "山口県",
    "徳島県",
    "香川県",
    "愛媛県",
    "高知県",
    "福岡県",
    "佐賀県",
    "長崎県",
    "熊本県",
    "大分県",
    "宮崎県",
    "鹿児島県",
    "沖縄県"
  ];
}
