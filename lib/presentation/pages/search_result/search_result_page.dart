import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../notifier/search/search_notifier.dart';
import 'widgets/search_result_panel.dart';

class SearchResultPage extends ConsumerWidget {
  const SearchResultPage({
    super.key,
    required this.facilityValue,
    required this.prefectureValue,
  });
  final List<String> facilityValue;
  final List<String> prefectureValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNotifierCTL = ref.watch(searchNotifierProvider.notifier)
      ..featchLiveHouseFromQuery(
        facilityValue,
        prefectureValue,
      );
    final searchNotifier = ref.watch(searchNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: searchNotifier.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ...List.generate(
                    data.length,
                    (index) => SearchResultPanel(
                      liveHouse: data[index],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
        error: (e, s) {
          return Text("エラー$e");
        },
        loading: () {
          return const Text("ロード");
        },
      ),
    );
  }
}
