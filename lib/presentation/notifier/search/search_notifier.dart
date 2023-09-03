import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house/live_house_service.dart';

import '../../../domain/live_house/value/live_house/live_house.dart';

final searchNotifierProvider = StateNotifierProvider
    .autoDispose<SearchNotifier, AsyncValue<List<LiveHouse>>>(
        (ref) => SearchNotifier(
              liveHouseService: ref.read(liveHouseServiceProvider),
            ));

class SearchNotifier extends StateNotifier<AsyncValue<List<LiveHouse>>> {
  SearchNotifier({required this.liveHouseService})
      : super(const AsyncLoading());
  final LiveHouseService liveHouseService;

  void clearState() {
    state = const AsyncData([]);
  }

  Future<void> featchLiveHouseFromQuery(
    List<String> facilityValue,
    List<String> prefectureValue,
  ) async {
    final result = await liveHouseService.featchLiveHouseFromQuery(
      prefectureValue,
    );

    final queryLiveHoues = facilityValue.isNotEmpty
        ? result
            .where((element) => facilityValue.contains(element.facilityType))
            .toList()
        : result;
    state = AsyncData(queryLiveHoues);
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
