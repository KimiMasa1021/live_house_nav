import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/indicator/%20record_indicator.dart';
import '../../notifier/article/article_lilst/article_list_notifier.dart';
import 'widgets/article_panel.dart';

class ArticlesListPage extends StatelessWidget {
  const ArticlesListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(testArticleNotifierProvider).maybeWhen(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    ArticlePanel(article: data[index]),
              );
            },
            orElse: () {
              return const RecordIndicator();
            },
          );
        },
      ),
    );
  }
}
