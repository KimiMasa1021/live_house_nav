import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/live_house_list/value/live_house/live_house.dart';
import 'package:live_house_nav/presentation/notifier/live_house_detail/live_houe_detail_notifier.dart';
import '../../../common/hex_color.dart';
import '../../../common/text_theme/text_theme.dart';
import 'widgets/sticky_tab_bar_delegate.dart';

class LiveHouseDetailPage extends ConsumerWidget {
  const LiveHouseDetailPage({
    super.key,
    required this.liveHouse,
  });

  final LiveHouse liveHouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    final liveHoueDetail =
        ref.watch(FeatchLiveHouseDetailProvider(priceId: liveHouse.placeId));
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
                            height: size.height / 2.5,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: const BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          liveHouse.name,
                                          style: font.fs16.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("EFEFEF"),
                                          ),
                                        ),
                                        Text(
                                          liveHouse.vicinity,
                                          maxLines: 1,
                                          style: font.fs13.copyWith(
                                            color: HexColor("9E9E9E"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
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
                                      return Container(
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
                                      );
                                    },
                                  ),
                                ),
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
                        Container(
                          child: Text("AA" + data.website),
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
              return Center(
                child: Text("エラー"),
              );
            },
            loading: () {
              return Center(
                child: Text("Loading..."),
              );
            },
          ),
        ),
      ),
    );
  }
}