import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:live_house_nav/presentation/notifier/profile/profile_list_notifier.dart';
import 'package:live_house_nav/presentation/pages/articles_list/widgets/two_sheet_image.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../domain/article/values/article.dart';
import '../../../../infrastructure/article/article_repository.dart';
import '../../../notifier/article/article_lilst/article_list_notifier.dart';
import '../../../notifier/profile/profile_notifier.dart';
import '../../article_detail/article_detail_page.dart';
import 'single_sheet_image.dart';

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
    var parser = EmojiParser();
    final uid = ref.watch(usersStreamProvider).value?.userId ?? "";
    final articles = ref.watch(testArticleNotifierProvider.notifier);

    return InkWell(
      onTap: () {
        ref.watch(articleDetailNotifierProvider.notifier).updateState(article);
        context.pushNamed(Routes.name().articleDetail);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userProfile.maybeWhen(
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
                      onPressed: () async {},
                      icon: const Icon(Icons.more_vert_outlined),
                    )
                  ],
                );
              },
              orElse: () {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          Image.asset(Assets.common.profile.path).image,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "",
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
                      onPressed: () async {},
                      icon: const Icon(Icons.more_vert_outlined),
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 5),
            Text(
              article.text,
              maxLines: 9,
            ),
            article.images.isEmpty
                ? const SizedBox(height: 10)
                : article.images.length == 1
                    ? SingleSheetImage(
                        image: article.images[0],
                        aspectRatio: article.minImageHeight,
                      )
                    : TwoSheetImage(images: article.images),
            StreamBuilder(
              stream: ref
                  .watch(articleRepositoryProvider)
                  .subscribeArticleEmoji(articleId: article.docId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Wrap(
                    children: [
                      ...List.generate(
                        article.emojis.length,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 1,
                          ),
                          margin: const EdgeInsets.only(right: 7, bottom: 7),
                          decoration: BoxDecoration(
                              color: HexColor("474747"),
                              borderRadius: BorderRadius.circular(200)),
                          child: Text(
                            parser.emojify('${article.emojis[index]} 0'),
                            style: textTheme.fs16,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        margin: const EdgeInsets.only(right: 7, bottom: 7),
                        decoration: BoxDecoration(
                          color: HexColor("474747"),
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: const Icon(Icons.tag_faces_outlined),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const SizedBox();
                } else {
                  return Wrap(
                    children: [
                      ...List.generate(
                        snapshot.data!.length,
                        (index) => InkWell(
                          onTap: () async {
                            await articles.addOrDeleteStamp(
                              snapshot.data![index],
                              uid,
                              article,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            margin: const EdgeInsets.only(right: 7, bottom: 7),
                            decoration: BoxDecoration(
                                color:
                                    snapshot.data![index].userList.contains(uid)
                                        ? HexColor("375BD9")
                                        : HexColor("474747"),
                                borderRadius: BorderRadius.circular(200)),
                            child: Text(
                              parser.emojify(
                                  '${snapshot.data![index].emoji} ${snapshot.data![index].userList.length}'),
                              style: textTheme.fs16,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          return showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            enableDrag: false,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 400,
                                child: EmojiPicker(
                                  onEmojiSelected:
                                      (Category? category, emoji) async {
                                    await articles.onTapEmojiSlecter(
                                      emoji.emoji,
                                      snapshot.data!,
                                      uid,
                                      article,
                                    );
                                    Navigator.pop(context);
                                  },
                                  onBackspacePressed: () {},
                                  config: Config(
                                    columns: 7,
                                    emojiSizeMax:
                                        32 * (Platform.isIOS ? 1.30 : 1.0),
                                    verticalSpacing: 0,
                                    horizontalSpacing: 0,
                                    initCategory: Category.RECENT,
                                    bgColor: const Color(0xFFF2F2F2),
                                    indicatorColor: Colors.blue,
                                    iconColor: Colors.grey,
                                    iconColorSelected: Colors.blue,
                                    backspaceColor: Colors.blue,
                                    skinToneDialogBgColor: Colors.white,
                                    skinToneIndicatorColor: Colors.grey,
                                    enableSkinTones: true,
                                    recentsLimit: 28,
                                    tabIndicatorAnimDuration:
                                        kTabScrollDuration,
                                    categoryIcons: const CategoryIcons(),
                                    buttonMode: ButtonMode.MATERIAL,
                                  ),
                                ),
                              );
                            },
                            backgroundColor: const Color(0x00000000),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          margin: const EdgeInsets.only(right: 7, bottom: 7),
                          decoration: BoxDecoration(
                            color: HexColor("474747"),
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: const Icon(Icons.tag_faces_outlined),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            article.artists.isNotEmpty
                ? Row(
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
                  )
                : const SizedBox(),
            Divider(color: HexColor("505050")),
          ],
        ),
      ),
    );
  }
}
