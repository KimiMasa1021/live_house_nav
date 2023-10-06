import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import '../../common/go_router_provider/routes/routes.dart';
import 'widgets/custom_bottom_bar.dart';

class PageRoot extends HookConsumerWidget {
  const PageRoot({
    super.key,
    required this.navigationShell,
  });

  Icon getDecaratedIcon(
    IconData icon, {
    bool isDisableEffect = true,
  }) {
    return Icon(
      icon,
      shadows: <Shadow>[
        Shadow(
          color: HexColor("00FFE0"),
          blurRadius: 15.0,
        )
      ],
      size: 25,
      color: HexColor("D3FFFA"),
    );
  }

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomBar(
        backgroundColor: HexColor("111111"),
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.home_outlined),
            activeIcon: getDecaratedIcon(Icons.home, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.search_outlined),
            activeIcon: getDecaratedIcon(Icons.search, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.library_books_outlined),
            activeIcon:
                getDecaratedIcon(Icons.library_books, isDisableEffect: true),
          ),
          BottomNavigationBarItem(
            icon: getDecaratedIcon(Icons.settings_outlined),
            activeIcon: getDecaratedIcon(Icons.settings, isDisableEffect: true),
          ),
        ],
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
