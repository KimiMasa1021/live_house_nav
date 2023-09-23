import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/presentation/pages/add_article/add_article_page.dart';
import 'package:live_house_nav/presentation/pages/articles_list/articles_list_page.dart';
import 'package:live_house_nav/presentation/pages/image_preview/image_preview_page.dart';
import 'package:live_house_nav/presentation/pages/live_house_detail/live_house_detail_page.dart';
import 'package:live_house_nav/presentation/pages/search/search_page.dart';
import 'package:live_house_nav/presentation/pages/search_result/search_result_page.dart';
import 'package:live_house_nav/presentation/pages/setting/setting_page.dart';
import 'package:live_house_nav/presentation/pages/text_search/text_search_page.dart';
import '../../presentation/pages/live_house_map/live_house_map_page.dart';
import '../../presentation/pages/page_root.dart';
import 'routes/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.path().liveHouseMap,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return PageRoot(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
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
                    parentNavigatorKey: _rootNavigatorKey,
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
                        parentNavigatorKey: _rootNavigatorKey,
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
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
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
                routes: [
                  GoRoute(
                    path: Routes.path().searchResult,
                    name: Routes.name().searchResult,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: SearchResultPage(
                          key: state.pageKey,
                          facilityValue: state.extra! as String,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: Routes.path().searchResultDetail,
                        name: Routes.name().searchResultDetail,
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
                            path: Routes.path().searchResultImagePreview,
                            name: Routes.name().searchResultImagePreview,
                            pageBuilder: (context, state) {
                              final imageInfo =
                                  state.extra as Map<String, dynamic>;
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
                    path: Routes.path().textSearch,
                    name: Routes.name().textSearch,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: TextSearchPage(
                          key: state.pageKey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
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
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
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
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
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
    ],
  ),
);
