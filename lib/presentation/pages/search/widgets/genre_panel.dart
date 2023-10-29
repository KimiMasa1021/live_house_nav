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
  });
  final FacilityType facilityType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.name().searchResult,
          extra: facilityType.name,
        );
      },
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(facilityType.imagePath),
            ),
            const SizedBox(height: 3),
            Text(
              facilityType.displayName,
              style: textTheme.fs14.copyWith(
                fontWeight: FontWeight.bold,
                color: HexColor("FFC700"),
                shadows: [
                  BoxShadow(
                    color: HexColor("FF0000"),
                    offset: const Offset(1, 1),
                    blurRadius: 0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
