import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
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

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 100,
                minLines: 1,
                decoration: InputDecoration(
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
                              aspectRatio: 3 / 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Text(
                "アーティストタグを追加",
                style: textTheme.fs15.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
https://api.spotify.com/v1/search?q=%E3%83%8F%E3%82%B7%E3%83%AA%E3%82%B3%E3%83%9F%E3%83%BC%E3%82%BA&type=album%2Cartist
*/ 