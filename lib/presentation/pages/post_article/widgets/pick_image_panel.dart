import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../notifier/article/post_article/post_article_notifier.dart';

class PickImagePanel extends ConsumerWidget {
  const PickImagePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postArticleNotifier = ref.watch(postArticleNotifierProvider.notifier);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: const Text('ギャラリーから'),
                  onTap: () async {
                    await postArticleNotifier.pickImage(
                      ImageSource.gallery,
                      () => Navigator.pop(context),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text('カメラから'),
                  onTap: () async {
                    await postArticleNotifier.pickImage(
                      ImageSource.camera,
                      () => Navigator.pop(context),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          width: size.width / 3,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
              ),
              child: Icon(
                Icons.add_a_photo_outlined,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
