import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../common/go_router_provider/routes/routes.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: (index) {
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
