import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/common/text_theme/text_theme.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import '../../../../domain/facility/value/facility/facility.dart';

class SearchResultPanel extends ConsumerWidget {
  const SearchResultPanel({
    super.key,
    required this.liveHouse,
  });
  final Facility liveHouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.name().liveHouseDetail,
          extra: liveHouse.placeId,
        );
      },
      child: Container(
        width: size.width,
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: HexColor("1E1E1E"),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: HexColor("292929"),
                  borderRadius: BorderRadius.circular(10),
                  image: liveHouse.imageUrl != ""
                      ? DecorationImage(
                          image: NetworkImage(liveHouse.imageUrl),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) => DecorationImage(
                            image: AssetImage(Assets.facility.noImage.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : DecorationImage(
                          image: AssetImage(Assets.facility.noImage.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        liveHouse.name,
                        maxLines: 1,
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
      ),
    );
  }
}
