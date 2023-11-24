import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/indicator/%20record_indicator.dart';
import '../../notifier/article/article/article_notifier.dart';
import 'widgets/article_panel.dart';

class ArticlesListPage extends ConsumerWidget {
  const ArticlesListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleNotifierProvider);
    return SafeArea(
      child: articles.maybeWhen(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: List.generate(
                  data.length,
                  (index) => ArticlePanel(article: data[index]),
                ),
              ),
            ),
          );
        },
        orElse: () {
          return const RecordIndicator();
        },
      ),
    );
  }
}
