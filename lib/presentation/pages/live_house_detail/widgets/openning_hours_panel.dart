import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house_list/value/opening_hours/opening_hours.dart';

import '../../../../common/hex_color.dart';
import '../../../../common/text_theme/text_theme.dart';
import '../../../../domain/live_house_list/value/store_hours/store_hours.dart';

class OpenningHoursPanel extends ConsumerWidget {
  const OpenningHoursPanel({
    super.key,
    required this.opeingHours,
  });
  final OpeingHours opeingHours;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextThemeProvider);

    final List<StoreHours> test = List.from(opeingHours.periods);
    final aaa = test.isNotEmpty ? test.removeAt(0) : null;
    if (aaa != null) test.add(aaa);

    var days = {
      0: "日",
      1: "月",
      2: "火",
      3: "水",
      4: "木",
      5: "金",
      6: "土",
    };

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: HexColor("4B4B4B"),
        ),
        color: HexColor("1E1E1E"),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
            ),
            child: Text(
              "OPENNING HOURS",
              style: font.fs16,
            ),
          ),
          test.isNotEmpty
              ? Column(
                  children: List.generate(
                    test.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("111111"),
                        borderRadius: test.length - 1 == index
                            ? const BorderRadius.vertical(
                                bottom: Radius.circular(15),
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            days[test[index].open.day].toString(),
                            style: font.fs16,
                          ),
                          Text(
                            "${test[index].open.time} ~ ${test[index].close.time}",
                            style: font.fs16,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor("111111"),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "情報が取得できませんでした。",
                      style: font.fs14,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
