import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/article/values/article.dart';
import 'package:live_house_nav/presentation/notifier/article/article/article_notifier.dart';

import '../../../common/hex_color.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../notifier/profile/profile_list_notifier.dart';

final articleDetailNotifierProvider =
    NotifierProvider<ArticleDetailNotifier, Article>(
  () => ArticleDetailNotifier(),
);

class ArticleDetailNotifier extends Notifier<Article> {
  @override
  build() {
    return Article();
  }

  void updateState(Article article) {
    state = article;
  }
}

class ArticleDetailPage extends ConsumerWidget {
  const ArticleDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(articleDetailNotifierProvider);
    final textTheme = ref.watch(myTextThemeProvider);
    final userProfile = ref.watch(profileListProvider(detail.userId));

    return Scaffold(
      appBar: AppBar(
        title: Text("ポスト"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userProfile.when(
              data: (profile) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: profile[0].image != ""
                          ? NetworkImage(profile[0].image)
                          : Image.asset(Assets.common.profile.path).image,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile[0].name,
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              Text(detail.facilityName),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined),
                    )
                  ],
                );
              },
              loading: () {
                return const Text("loading...");
              },
              error: (e, s) {
                return Text("$e");
              },
            ),
            const SizedBox(height: 7),
            Text(
              detail.text,
              style: textTheme.fs16,
            ),
            const SizedBox(height: 7),
            ...List.generate(
              detail.artists.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          NetworkImage(detail.artists[index].images[0].url),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      detail.artists[index].name,
                      style: textTheme.fs15.copyWith(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
