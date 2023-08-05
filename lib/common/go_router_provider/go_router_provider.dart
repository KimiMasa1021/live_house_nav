import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/presentation/pages/add_article/add_article_page.dart';
import 'package:live_house_nav/presentation/pages/articles_list/articles_list_page.dart';
import 'package:live_house_nav/presentation/pages/image_preview/image_preview_page.dart';
import 'package:live_house_nav/presentation/pages/live_house_detail/live_house_detail_page.dart';
import 'package:live_house_nav/presentation/pages/search/search_page.dart';
import 'package:live_house_nav/presentation/pages/setting/setting_page.dart';
import '../../presentation/pages/live_house_map/live_house_map_page.dart';
import '../../presentation/pages/page_root.dart';
import 'routes/global_navigator_keys.dart';
import 'routes/routes.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.path().liveHouseMap,
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
            path: Routes.path().liveHouseMap,
            name: Routes.name().liveHouseMap,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: LiveHouseMapPage(
                  key: state.pageKey,
                ),
              );
            },
            routes: [
              GoRoute(
                path: Routes.path().liveHouseDetail,
                name: Routes.name().liveHouseDetail,
                parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                pageBuilder: (context, state) {
                  final liveHoue = state.extra.toString();
                  return NoTransitionPage(
                    child: LiveHouseDetailPage(
                      key: state.pageKey,
                      liveHouse: liveHoue,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.path().imagePreview,
                    name: Routes.name().imagePreview,
                    parentNavigatorKey: GlobalNavigatorKeys.rootNavigator,
                    pageBuilder: (context, state) {
                      final imageInfo = state.extra as Map<String, dynamic>;
                      return NoTransitionPage(
                        child: ImagePreviewPage(
                          key: state.pageKey,
                          imageList: imageInfo["images"],
                          initialIndex: imageInfo["initialIndex"],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Routes.path().articlesList,
            name: Routes.name().articlesList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ArticlesListPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.path().addArticles,
            name: Routes.name().addArticles,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AddArticlePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.path().searchPage,
            name: Routes.name().searchPage,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SearchPage(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: Routes.path().setting,
            name: Routes.name().setting,
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
