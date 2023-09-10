import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../notifier/search/search_notifier.dart';
import 'widgets/search_result_panel.dart';

class SearchResultPage extends ConsumerWidget {
  const SearchResultPage({
    super.key,
    required this.facilityValue,
  });
  final List<String> facilityValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNotifier = ref.watch(searchNotifierProvider(facilityValue));

    return Scaffold(
      appBar: AppBar(),
      body: searchNotifier.when(
        data: (data) {
          debugPrint(data.toString());
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
