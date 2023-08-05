import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/go_router_provider/routes/routes.dart';
import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../domain/live_house/value/live_house/live_house.dart';

class LiveHouseSuggest extends ConsumerWidget {
  const LiveHouseSuggest({
    super.key,
    required this.textSearch,
  });
  final LiveHouse textSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);

    return InkWell(
      onTap: () {
        primaryFocus?.unfocus();
        context.pushNamed(
          Routes.name().liveHouseDetail,
          extra: textSearch.placeId,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textSearch.name,
              style: textTheme.fs16.copyWith(
                color: HexColor("EFEFEF"),
              ),
            ),
            const SizedBox(height: 2),
            Divider(
              color: HexColor("9E9E9E"),
            )
          ],
        ),
      ),
    );
  }
}
