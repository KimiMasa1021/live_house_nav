import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/gen/assets.gen.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../domain/facility/value/facility/facility.dart';

class NewFacilityPanel extends ConsumerWidget {
  const NewFacilityPanel({
    super.key,
    required this.liveHouse,
  });
  final Facility liveHouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    return Container(
      width: size.width / 3,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 3,
            height: size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(liveHouse.imageUrl),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) =>
                    AssetImage(Assets.facility.noImage.path),
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(
              liveHouse.name,
              style: textTheme.fs16.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(
              liveHouse.vicinity,
              style: textTheme.fs12.copyWith(
                color: HexColor("9F9F9F"),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
