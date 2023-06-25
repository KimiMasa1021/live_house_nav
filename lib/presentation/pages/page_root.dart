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
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex.value,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.black,
      //   onTap: (index) {

      //   },
      //   items: const [

      //   ],
      // ),
    );
  }
}
