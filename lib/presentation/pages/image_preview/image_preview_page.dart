import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({
    super.key,
    required this.imageList,
    required this.initialIndex,
  });
  final List<String> imageList;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initialIndex);
    return Scaffold(
      appBar: AppBar(),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              imageList[index],
            ),
          );
        },
        itemCount: imageList.length,
        loadingBuilder: (context, event) => const Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
        pageController: pageController,
      ),
    );
  }
}
