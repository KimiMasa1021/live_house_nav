import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../notifier/live_house/live_house_notifier.dart';
import 'live_house_panel.dart';

class LiveHouseListView extends HookConsumerWidget {
  const LiveHouseListView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveHouseNotifier = ref.watch(liveHouseNotifierProvider);
    final size = MediaQuery.of(context).size;
    return liveHouseNotifier.when(
      data: (liveHoue) {
        return Align(
          alignment: const Alignment(0, 1),
          child: Container(
            width: size.width,
            height: 140,
            margin: const EdgeInsets.only(bottom: 15),
            child: PageView(
              controller: pageController,
              children: liveHoue.results.results.map(
                (house) {
                  return LiveHousePanel(
                    liveHouse: house,
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
      error: (e, s) {
        return const SizedBox();
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
