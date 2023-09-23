import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../../common/text_theme/text_theme.dart';

class FacilityInfoLink extends ConsumerWidget {
  const FacilityInfoLink({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextThemeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          title != ""
              ? Text(
                  title,
                  style: font.fs14.copyWith(color: Colors.blue),
                )
              : Text(
                  "情報なし",
                  style: font.fs14.copyWith(color: HexColor("FFFFFF")),
                ),
        ],
      ),
    );
  }
}
