import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/presentation/pages/search/widgets/live_house_search_bar.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../notifier/search/search_notifier.dart';
import 'widgets/live_house_filter_chip.dart';
import 'widgets/live_house_suggest.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchLiveHouse = ref.watch(searchNotifierProvider);
    final searchLiveHouseCTL = ref.watch(searchNotifierProvider.notifier);

    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const LiveHouseSearchBar(),
      ),
      body: searchLiveHouse.isEmpty
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "タイプ別",
                            maxLines: 1,
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LiveHousefilterChip(
                              filterText: "ライブハウス",
                            ),
                            LiveHousefilterChip(
                              filterText: "ホール",
                            ),
                            LiveHousefilterChip(
                              filterText: "アリーナ",
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "北海道・東北",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            7,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "関東",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            7,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 7],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "北陸・甲信越",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            6,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 14],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "東海",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            4,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 20],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "近畿",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            6,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 24],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "中国・四国",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            9,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 30],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "九州・沖縄",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("EFEFEF"),
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            8,
                            (index) => LiveHousefilterChip(
                              filterText:
                                  searchLiveHouseCTL.prefectureList[index + 39],
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor("FFFFFF"),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "検索",
                            style: textTheme.fs16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HexColor("000000"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                ...List.generate(
                  searchLiveHouse.length,
                  (index) => LiveHouseSuggest(
                    textSearch: searchLiveHouse[index],
                  ),
                )
              ],
            ),
    );
  }
}
