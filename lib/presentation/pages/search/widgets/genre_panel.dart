import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/go_router_provider/routes/routes.dart';
import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../constant/facility_type.dart';

class GenrePanel extends ConsumerWidget {
  const GenrePanel({
    super.key,
    required this.facilityType,
    required this.imagePath,
  });
  final FacilityType facilityType;
  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.name().searchResult,
          extra: {
            "facilityValue": [facilityType.name],
            "prefectureValue": [],
          },
        );
      },
      child: Container(
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 7),
            Text(
              facilityType.displayName,
              style: textTheme.fs16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
