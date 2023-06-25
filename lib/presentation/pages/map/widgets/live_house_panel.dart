import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/common/text_theme/text_theme.dart';
import '../../../../domain/live_house_list/value/live_house/live_house.dart';

class LiveHousePanel extends ConsumerWidget {
  const LiveHousePanel({
    super.key,
    required this.liveHouse,
  });
  final LiveHouse liveHouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    return Container(
      width: size.width,
      height: 170,
      margin: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        color: HexColor("111111"),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor("292929"),
                        borderRadius: BorderRadius.circular(10),
                        image: liveHouse.imageUrl != ""
                            ? DecorationImage(
                                image: NetworkImage(liveHouse.imageUrl),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) =>
                                    const DecorationImage(
                                  image: AssetImage("assets/pngs/no_image.png"),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const DecorationImage(
                                image: AssetImage("assets/pngs/no_image.png"),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      liveHouse.name,
                      style: textTheme.fs16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: HexColor("EFEFEF"),
                      ),
                    ),
                    Text(
                      liveHouse.vicinity,
                      maxLines: 1,
                      style: textTheme.fs13.copyWith(
                        color: HexColor("9E9E9E"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
