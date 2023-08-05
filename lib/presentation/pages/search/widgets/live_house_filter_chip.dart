import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../../common/text_theme/text_theme.dart';

class LiveHousefilterChip extends HookConsumerWidget {
  const LiveHousefilterChip({
    super.key,
    required this.filterText,
  });
  final String filterText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSeleced = useState(false);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        isSeleced.value = !isSeleced.value;
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
            child: Text(filterText),
          ),
        ),
      ),
    );
  }
}
