import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/go_router_provider/routes/routes.dart';
import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';

class FakeSearchBar extends ConsumerWidget {
  const FakeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.name().textSearch);
      },
      child: Container(
        width: size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: HexColor("131313"),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: HexColor("4B4B4B"),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "エリア・施設名・キーワード",
                style: textTheme.fs16.copyWith(color: HexColor("757575")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
