import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../../common/text_theme/text_theme.dart';
import '../../../../constant/facility_type.dart';
import '../search_page.dart';

class FilterChipFacility extends HookConsumerWidget {
  const FilterChipFacility({
    super.key,
    required this.facilityType,
    required this.facilityValue,
  });
  final FacilityType facilityType;
  final ValueNotifier<List<String>> facilityValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSeleced = useState(false);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        if (isSeleced.value) {
          isSeleced.value = false;
          final newList = facilityValue.value;
          newList.remove(facilityType.name);
          facilityValue.value = newList;
        } else {
          isSeleced.value = true;
          facilityValue.value = [...facilityValue.value, facilityType.name];
        }
      },
      child: Container(
        width: size.width / 3,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: HexColor("1E1E1E"),
            border: Border.all(
              color: isSeleced.value ? HexColor("95A7B1") : HexColor("4B4B4B"),
            ),
            borderRadius: BorderRadius.circular(100),
            boxShadow: isSeleced.value
                ? [
                    BoxShadow(
                      blurRadius: 5,
                      color: HexColor("0098EE"),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(facilityType.displayName),
          ),
        ),
      ),
    );
  }
}
