import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../notifier/article/article/article_notifier.dart';
import 'widgets/article_panel.dart';

class ArticlesListPage extends ConsumerWidget {
  const ArticlesListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleNotifierProvider);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: articles.maybeWhen(
            data: (data) {
              return Column(
                children: List.generate(
                  data.length,
                  (index) => ArticlePanel(article: data[index]),
                ),
              );
            },
            orElse: () {},
          ),
        ),
      ),
    );
  }
}
