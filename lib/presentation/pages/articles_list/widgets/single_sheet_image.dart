import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/common/hex_color.dart';

class SingleSheetImage extends StatelessWidget {
  const SingleSheetImage({
    super.key,
    required this.image,
    required this.aspectRatio,
  });
  final String image;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    // 1枚だけ表示するよ
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.name().imagePreview,
            extra: {
              "images": [image],
              "initialIndex": 0,
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: HexColor("1E1E1E"),
                ),
              );
            },
            fadeInDuration: const Duration(microseconds: 0),
          ),
        ),
      ),
    );
  }
}
