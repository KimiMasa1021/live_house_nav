import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/presentation/notifier/facility/search_by_type/search_by_type_notifier.dart';

import '../../../common/indicator/ record_indicator.dart';
import 'widgets/search_result_panel.dart';

class SearchResultPage extends HookConsumerWidget {
  const SearchResultPage({
    super.key,
    required this.facilityValue,
  });
  final String facilityValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchNotifier =
        ref.watch(searchByTypeNotifierProvider(facilityValue));
    final searchNotifierCTL =
        ref.watch(searchByTypeNotifierProvider(facilityValue).notifier);
    final scrollController = useScrollController();
    final isLoading = useState(false);
    scrollController.addListener(() async {
      double positionRate =
          scrollController.offset / scrollController.position.maxScrollExtent;
      const threshold = 0.8;
      if (positionRate > threshold && !isLoading.value) {
        isLoading.value = true;
        await searchNotifierCTL.fetchNextItems();
        isLoading.value = false;
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: searchNotifier.when(
        data: (data) {
          return SingleChildScrollView(
            controller: scrollController,
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
                ],
              ),
            ),
          );
        },
        error: (e, s) {
          return Text("エラー$e");
        },
        loading: () {
          return const RecordIndicator();
        },
      ),
    );
  }
}
