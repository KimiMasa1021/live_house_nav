import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/presentation/pages/articles_list/articles_list_page.dart';
import 'package:live_house_nav/presentation/pages/live_house_detail/live_house_detail.dart';
import 'package:live_house_nav/presentation/pages/notification/notification_page.dart';
import 'package:live_house_nav/presentation/pages/setting/setting_page.dart';
import '../../presentation/pages/live_house_map/live_house_map_page.dart';
import '../../presentation/pages/page_root.dart';
import 'routes/global_navigator_keys.dart';
import 'routes/routes.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.liveHouseMap,
    navigatorKey: GlobalNavigatorKeys.rootNavigator,
    routes: [
      ShellRoute(
        navigatorKey: GlobalNavigatorKeys.shellNavigator,
        builder: (context, state, child) => PageRoot(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: Routes.liveHouseMap,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: LiveHouseMapPage(
                  key: state.pageKey,
                ),
              );
            },
            routes: [
              GoRoute(
                path: Routes.liveHouseDetail,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: LiveHouseDetail(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.articlesList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ArticlesListPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.notification,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: NotificationPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.setting,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
  ),
);
