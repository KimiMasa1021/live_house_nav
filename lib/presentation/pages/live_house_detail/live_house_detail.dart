import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/hex_color.dart';
import '../../../common/text_theme/text_theme.dart';
import 'widgets/sticky_tab_bar_delegate.dart';

class LiveHouseDetail extends ConsumerWidget {
  const LiveHouseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextThemeProvider);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: NestedScrollView(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "下北沢　近道",
                                      style: font.fs16.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("EFEFEF"),
                                      ),
                                    ),
                                    Text(
                                      "liveHouse.vicinity",
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
                                itemCount: 10,
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
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://cdn-img.music-mdata.com/inner/photo/2314@2x.jpg"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: HexColor("292929"),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.reviews_outlined),
                                      SizedBox(width: 8),
                                      Text("口コミ投稿")
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: HexColor("292929"),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: Row(
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
                      indicatorColor:
                          Theme.of(context).colorScheme.onBackground,
                      labelColor: Theme.of(context).colorScheme.onBackground,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onBackground,
                      labelStyle: font.fs16,
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
                    Container(),
                    Container(),
                    Container(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
