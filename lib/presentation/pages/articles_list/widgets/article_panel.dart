import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:live_house_nav/presentation/notifier/profile/profile_list_notifier.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../domain/article/values/article.dart';
import '../../article_detail/article_detail_page.dart';

class ArticlePanel extends ConsumerWidget {
  const ArticlePanel({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    final artistsNameList = article.artists
        .map((e) => e.name)
        .toList()
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "");

    final userProfile = ref.watch(profileListProvider(article.userId));

    return InkWell(
      onTap: () {
        ref.watch(articleDetailNotifierProvider.notifier).updateState(article);
        context.pushNamed(Routes.name().articleDetail);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
        ),
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
                    const SizedBox(width: 10),
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
                              Text(article.facilityName),
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
            const SizedBox(height: 5),
            Text(
              article.text,
              maxLines: 9,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.people_alt_outlined),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    artistsNameList.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: HexColor("505050"),
            )
          ],
        ),
      ),
    );
  }
}
