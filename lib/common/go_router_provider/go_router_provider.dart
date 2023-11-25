import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/presentation/pages/article_detail/article_detail_page.dart';
import 'package:live_house_nav/presentation/pages/auth/sign_in/sign_in_page.dart';
import 'package:live_house_nav/presentation/pages/post_article/post_article_page.dart';
import 'package:live_house_nav/presentation/pages/articles_list/articles_list_page.dart';
import 'package:live_house_nav/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:live_house_nav/presentation/pages/auth/wait_screen/wait_screen_page.dart';
import 'package:live_house_nav/presentation/pages/image_preview/image_preview_page.dart';
import 'package:live_house_nav/presentation/pages/facility_detail/facility_detail_page.dart';
import 'package:live_house_nav/presentation/pages/post_article/set_artists/set_artists_page.dart';
import 'package:live_house_nav/presentation/pages/search/search_page.dart';
import 'package:live_house_nav/presentation/pages/search_result/search_result_page.dart';
import 'package:live_house_nav/presentation/pages/profile/profile_page.dart';
import 'package:live_house_nav/presentation/pages/text_search/text_search_page.dart';
import '../../domain/facility_detail/values/facility_detail/facility_detail.dart';
import '../../presentation/pages/map/map_page.dart';
import '../../presentation/pages/page_root.dart';
import 'routes/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.path().searchPage,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return PageRoot(
            navigationShell: navigationShell,
          );
        },
        branches: [
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
                            child: FacilityDetailPage(
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
                  GoRoute(
                    path: Routes.path().liveHouseMap,
                    name: Routes.name().liveHouseMap,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: MapPage(
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
                            child: FacilityDetailPage(
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
                          GoRoute(
                            path: Routes.path().postArticle,
                            name: Routes.name().postArticle,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) {
                              final detail = state.extra as FacilityDetail;
                              return NoTransitionPage(
                                child: PostArticlePage(
                                  facilityDetail: detail,
                                ),
                              );
                            },
                            routes: [
                              GoRoute(
                                path: Routes.path().setArtists,
                                name: Routes.name().setArtists,
                                parentNavigatorKey: _rootNavigatorKey,
                                pageBuilder: (context, state) {
                                  return NoTransitionPage(
                                    child: SetArtistsPage(
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
                ],
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
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: Routes.path().articleDetail,
                    name: Routes.name().articleDetail,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        transitionDuration: const Duration(milliseconds: 200),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 200),
                        child: ArticleDetailPage(
                          key: state.pageKey,
                        ),
                        transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                        ) {
                          const Offset begin = Offset(1.0, 0.0);
                          const Offset end = Offset.zero;
                          final Tween<Offset> tween =
                              Tween(begin: begin, end: end);
                          final Animation<Offset> offsetAnimation =
                              animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
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
                path: Routes.path().profile,
                name: Routes.name().profile,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: ProfilePage(
                      key: state.pageKey,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.path().signUp,
                    name: Routes.name().signUp,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return const NoTransitionPage(
                        child: SignUpPage(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: Routes.path().waitScreen,
                        name: Routes.name().waitScreen,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) {
                          return const NoTransitionPage(
                            child: WaitScreenPage(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.path().signInPage,
                    name: Routes.name().signInPage,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return const NoTransitionPage(
                        child: SignInPage(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
