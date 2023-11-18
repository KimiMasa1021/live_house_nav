import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/gen/assets.gen.dart';

class RecordIndicator extends HookConsumerWidget {
  const RecordIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 5),
    );
    final size = MediaQuery.of(context).size;

    useEffect(() {
      controller.repeat();
    }, const []);

    return Center(
      child: Stack(
        children: [
          RotationTransition(
            turns: controller,
            child: Image.asset(
              Assets.common.disc.path,
              width: size.width / 1.5,
            ),
          ),
          Image.asset(
            Assets.common.arm.path,
            width: size.width / 1.5,
          ),
          Image.asset(
            Assets.common.loadingText.path,
            width: size.width / 1.5,
          )
        ],
      ),
    );
  }
}
