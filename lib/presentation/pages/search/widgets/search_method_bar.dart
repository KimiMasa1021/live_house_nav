import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.fs20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(200),
              ),
              child: Text(
                "検索",
                style: textTheme.fs15.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
