import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/text_search/live_house_suggests.dart';
import 'package:live_house_nav/presentation/notifier/text_search/text_search_notifier.dart';

import '../widgets/live_house_search_bar.dart';
import '../search/widgets/live_house_suggest.dart';

class TextSearchPage extends ConsumerWidget {
  const TextSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textSearch = ref.watch(textSearchNotifierProvider);
    final textSearchNotifier = ref.watch(textSearchNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 30,
        title: const LiveHouseSearchBar(),
      ),
      body: Column(
        children: List.generate(
          textSearch.candidates.length,
          (index) => LiveHouseSuggest(
            textSearch: textSearch.candidates[index],
          ),
        ),
      ),
    );
  }
}
