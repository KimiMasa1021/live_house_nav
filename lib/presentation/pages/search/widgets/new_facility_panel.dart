import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/gen/assets.gen.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';

class NewFacilityPanel extends ConsumerWidget {
  const NewFacilityPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 2.7,
            height: size.width / 2.7,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.facility.liveHouse.path),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(
              "下北沢Shelter",
              style: textTheme.fs16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(
              "東京都練馬区豊玉中",
              style: textTheme.fs12.copyWith(
                color: HexColor("9F9F9F"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
