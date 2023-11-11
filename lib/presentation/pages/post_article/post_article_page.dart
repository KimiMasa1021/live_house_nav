import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/presentation/notifier/article/post_article/post_article_notifier.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../../domain/facility_detail/values/facility_detail/facility_detail.dart';
import 'widgets/pick_image_panel.dart';

class PostArticlePage extends HookConsumerWidget {
  const PostArticlePage({
    super.key,
    required this.facilityDetail,
  });
  final FacilityDetail facilityDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    final postArticle = ref.watch(postArticleNotifierProvider);
    final postArticleNotifier = ref.watch(postArticleNotifierProvider.notifier);
    final textController = useTextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await postArticleNotifier.postArticle(
                  textController.text, facilityDetail);
            },
            icon: const Icon(
              Icons.post_add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(width: 5),
                  Text(facilityDetail.name),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: textController,
                maxLines: 100,
                minLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "テキスト...",
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  postArticle.pickedImages.isEmpty
                      ? const PickImagePanel()
                      : const SizedBox(),
                  ...List.generate(
                    postArticle.pickedImages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: size.width / 3,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: FileImage(
                                        postArticle.pickedImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              onTap: () {
                                postArticleNotifier.removePickerImage(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 207, 207, 207),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  postArticle.pickedImages.isNotEmpty &&
                          postArticle.pickedImages.length <= 2
                      ? const PickImagePanel()
                      : const SizedBox(),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            postArticle.artists.items.isNotEmpty
                ? Column(
                    children: List.generate(
                      postArticle.artists.items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(postArticle
                                  .artists.items[index].images[0].url),
                            ),
                            const SizedBox(width: 5),
                            Text(postArticle.artists.items[index].name)
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.name().setArtists);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Text(
                  "アーティストタグを追加",
                  style: textTheme.fs15.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
