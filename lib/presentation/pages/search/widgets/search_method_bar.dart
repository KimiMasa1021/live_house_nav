import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../../common/text_theme/text_theme.dart';

class SearchMethodBar extends ConsumerWidget {
  const SearchMethodBar({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);

    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          bottom: 10,
          right: 15,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: HexColor("E4E4E4"),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                Icons.map_outlined,
                color: HexColor("242424"),
                size: 30,
              ),
              Text(
                text,
                style: textTheme.fs20.copyWith(
                  fontWeight: FontWeight.bold,
                  color: HexColor("242424"),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: HexColor("242424"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "open map",
                  style: textTheme.fs15.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
