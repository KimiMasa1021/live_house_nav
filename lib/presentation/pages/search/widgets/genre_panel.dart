import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';

class GenrePanel extends ConsumerWidget {
  const GenrePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2 - 15,
      height: 51,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: HexColor("2A2A2A"),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Text(
            "ライブハウス",
            style: textTheme.fs16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
