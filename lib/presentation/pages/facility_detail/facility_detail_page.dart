import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/presentation/pages/facility_detail/widgets/openning_hours_panel.dart';
import '../../../common/hex_color.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../notifier/facility/detail/facility_detail_notifier.dart';
import 'widgets/facility_info_link.dart';
import 'widgets/sticky_tab_bar_delegate.dart';

class FacilityDetailPage extends ConsumerWidget {
  const FacilityDetailPage({
    super.key,
    required this.liveHouse,
  });

  final String liveHouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    final liveHoueDetail =
        ref.watch(FeatchFacilityDetailProvider(priceId: liveHouse));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: liveHoueDetail.when(
            data: (data) {
              return NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innnerBoxIsScrolled) {
                  return [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            width: size.width,
                            height: data.imageList.isNotEmpty
                                ? size.height / 2.5
                                : null,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.name,
                                      style: font.fs16.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("EFEFEF"),
                                      ),
                                    ),
                                    Text(
                                      data.vicinity,
                                      maxLines: 1,
                                      style: font.fs13.copyWith(
                                        color: HexColor("9E9E9E"),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                data.imageList.isNotEmpty
                                    ? Expanded(
                                        child: GridView.builder(
                                        itemCount: data.imageList.length,
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate: SliverQuiltedGridDelegate(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,
                                          repeatPattern:
                                              QuiltedGridRepeatPattern.inverted,
                                          pattern: [
                                            const QuiltedGridTile(2, 2),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(2, 2),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(2, 2),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(2, 2),
                                            const QuiltedGridTile(1, 1),
                                            const QuiltedGridTile(1, 1),
                                          ],
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              context.pushNamed(
                                                Routes.name().imagePreview,
                                                extra: {
                                                  "images": data.imageList,
                                                  "initialIndex": index,
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    data.imageList[index],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ))
                                    : const SizedBox(),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 8,
                                      ),
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: HexColor("292929"),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.reviews_outlined),
                                          SizedBox(width: 8),
                                          Text("口コミ投稿")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 8,
                                      ),
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: HexColor("292929"),
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.map_outlined),
                                          SizedBox(width: 8),
                                          Text("マップで表示")
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: StickyTabBarDelegate(
                        backgroundColor: HexColor("1E1E1E"),
                        tabBar: TabBar(
                          indicatorWeight: 2.0,
                          indicatorColor: HexColor("FF2C2C"),
                          labelColor: HexColor("FFFFFF"),
                          tabs: const [
                            Tab(text: "施設情報"),
                            Tab(text: "口コミ"),
                            Tab(text: "概要"),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Builder(
                  builder: (context) {
                    return TabBarView(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                FacilityInfoLink(
                                  icon: Icons.language_outlined,
                                  title: data.website,
                                ),
                                FacilityInfoLink(
                                  icon: Icons.call_outlined,
                                  title: data.formattedPhoneNumber,
                                ),
                                OpenningHoursPanel(
                                  opeingHours: data.openingHours,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(),
                        Container(),
                      ],
                    );
                  },
                ),
              );
            },
            error: (Object error, StackTrace stackTrace) {
              return const Center(
                child: Text("エラー"),
              );
            },
            loading: () {
              return const Center(
                child: Text("Loading..."),
              );
            },
          ),
        ),
      ),
    );
  }
}
