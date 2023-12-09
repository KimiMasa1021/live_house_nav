import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/indicator/%20record_indicator.dart';
import 'package:live_house_nav/infrastructure/article/article_repository.dart';
import '../../notifier/article/article_lilst/article_list_notifier.dart';
import 'widgets/article_panel.dart';

class ArticlesListPage extends HookConsumerWidget {
  const ArticlesListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesNotifier = ref.watch(testArticleNotifierProvider.notifier);
    final scrollController = useScrollController();
    bool isLoading = false;
    scrollController.addListener(() async {
      double positionRate =
          scrollController.offset / scrollController.position.maxScrollExtent;
      const threshold = 0.8;
      if (positionRate > threshold && !isLoading) {
        isLoading = true;
        await articlesNotifier.fetchNextArticles();
        isLoading = false;
      }
    });

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await articlesNotifier.fetchNewArticles();
        },
        child: HookConsumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            useAutomaticKeepAlive(wantKeepAlive: true);
            return ref.watch(testArticleNotifierProvider).maybeWhen(
              data: (data) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      ArticlePanel(article: data[index]),
                  addAutomaticKeepAlives: true,
                );
              },
              orElse: () {
                return const RecordIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}
