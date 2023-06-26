import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import '../../common/go_router_provider/routes/routes.dart';
import 'widgets/custom_bottom_bar.dart';

class PageRoot extends HookConsumerWidget {
  final Widget child;

  const PageRoot({
    super.key,
    required this.child,
  });

  DecoratedIcon getDecaratedIcon(
    IconData icon, {
    bool isDisableEffect = false,
  }) {
    return DecoratedIcon(
      icon,
      shadows: isDisableEffect
          ? []
          : [
              BoxShadow(
                color: HexColor("FFFFFF"),
                blurRadius: 5,
              ),
            ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomBar(
        backgroundColor: HexColor("111111"),
        currentIndex: currentIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.home_outlined),
            activeIcon: getDecaratedIcon(Icons.home, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.list_outlined),
            activeIcon: getDecaratedIcon(Icons.list, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.add_box_outlined),
            activeIcon: getDecaratedIcon(Icons.add_box, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.notifications_outlined),
            activeIcon:
                getDecaratedIcon(Icons.notifications, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.settings_outlined),
            activeIcon: getDecaratedIcon(Icons.settings, isDisableEffect: true),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              context.go(Routes.liveHouseMap);
              currentIndex.value = index;
              break;
            case 1:
              context.go(Routes.articlesList);
              currentIndex.value = index;
              break;
            case 2:
              context.go(Routes.notification);
              currentIndex.value = index;
              break;
            case 3:
              context.go(Routes.setting);
              currentIndex.value = index;
              break;
          }
        },
      ),
    );
  }
}
