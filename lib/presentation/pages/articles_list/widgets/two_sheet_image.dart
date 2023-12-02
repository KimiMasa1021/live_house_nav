import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';

class TwoSheetImage extends StatelessWidget {
  const TwoSheetImage({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    // 2枚だけ表示するよ
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.pushNamed(
                  Routes.name().imagePreview,
                  extra: {
                    "images": images,
                    "initialIndex": 0,
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      images[0],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: InkWell(
              onTap: () {
                context.pushNamed(
                  Routes.name().imagePreview,
                  extra: {
                    "images": images,
                    "initialIndex": 1,
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      images[1],
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
