import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/article/values/article.dart';
import 'package:live_house_nav/presentation/notifier/article/article/article_notifier.dart';

import '../../../common/hex_color.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../notifier/article/article_lilst/article_list_notifier.dart';
import '../../notifier/article/emoji/emoji_notifier.dart';
import '../../notifier/profile/profile_list_notifier.dart';
import '../../notifier/profile/profile_notifier.dart';
import '../articles_list/widgets/single_sheet_image.dart';
import '../articles_list/widgets/two_sheet_image.dart';

// final articleDetailNotifierProvider =
//     NotifierProvider<ArticleDetailNotifier, Article>(
//   () => ArticleDetailNotifier(),
// );

// class ArticleDetailNotifier extends Notifier<Article> {
//   @override
//   build() {
//     return Article();
//   }

//   void updateState(Article article) {
//     state = article;
//   }
// }

class ArticleDetailPage extends ConsumerWidget {
  const ArticleDetailPage({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(usersStreamProvider).value?.userId ?? "";
    final textTheme = ref.watch(myTextThemeProvider);
    final userProfile = ref.watch(profileListProvider(article.userId));
    final emojis = ref.watch(emojiStreamProvider(article.docId));
    final articles = ref.watch(testArticleNotifierProvider.notifier);
    var parser = EmojiParser();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ポスト"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                                Expanded(
                                  child: Text(
                                    article.facilityName,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
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
                article.text,
                style: textTheme.fs16,
              ),
              const SizedBox(height: 7),
              article.images.isEmpty
                  ? const SizedBox()
                  : article.images.length == 1
                      ? SingleSheetImage(
                          image: article.images[0],
                          aspectRatio: article.minImageHeight,
                        )
                      : TwoSheetImage(images: article.images),
              const SizedBox(height: 7),
              ...List.generate(
                article.artists.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage(article.artists[index].images[0].url),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        article.artists[index].name,
                        style: textTheme.fs15.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              emojis.when(
                data: (emojis) {
                  return Wrap(
                    children: [
                      ...List.generate(
                        emojis.length,
                        (index) => InkWell(
                          onTap: () async {
                            await articles.addOrDeleteStamp(
                              emojis[index],
                              uid,
                              article,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            margin: const EdgeInsets.only(right: 7, bottom: 7),
                            decoration: BoxDecoration(
                                color: emojis[index].userList.contains(uid)
                                    ? HexColor("375BD9")
                                    : HexColor("474747"),
                                borderRadius: BorderRadius.circular(200)),
                            child: Text(
                              parser.emojify(
                                  '${emojis[index].emoji} ${emojis[index].userList.length}'),
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
                                      emojis,
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
                },
                error: (e, s) {
                  return const SizedBox();
                },
                loading: () {
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
