import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/common/hex_color.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:live_house_nav/presentation/pages/search/widgets/genre_panel.dart';
import 'package:live_house_nav/presentation/pages/search/widgets/live_house_search_bar.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../notifier/search/search_notifier.dart';
import '../../notifier/text_search/text_search_notifier.dart';
import 'widgets/filter_chip_facility.dart';
import 'widgets/filter_chip_prefecture.dart';
import 'widgets/live_house_suggest.dart';
import 'widgets/new_facility_panel.dart';

enum FacilityType {
  liveHoue('ライブハウス'),
  hole('ホール'),
  arena('アリーナ');

  final String displayName;
  const FacilityType(this.displayName);
}

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final searchLiveHouse = ref.watch(searchNotifierProvider);
    final searchLiveHouseCTL = ref.watch(searchNotifierProvider.notifier);
    final textSearchLiveHouse = ref.watch(textSearchNotifierProvider);
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    final ValueNotifier<List<String>> facilityValue = useState([]);
    final ValueNotifier<List<String>> prefectureValue = useState([]);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const LiveHouseSearchBar(),
      ),
      body: textSearchLiveHouse.candidates.isEmpty
          ? SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Text(
                        "ジャンル",
                        style: textTheme.fs20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            GenrePanel(
                              title: 'ホール',
                              imagePath: Assets.facility.hole.path,
                            ),
                            GenrePanel(
                              title: 'アリーナ',
                              imagePath: Assets.facility.aina.path,
                            ),
                            GenrePanel(
                              title: 'クラブ',
                              imagePath: Assets.facility.club.path,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            GenrePanel(
                              title: 'ライブハウス',
                              imagePath: Assets.facility.liveHouse.path,
                            ),
                            GenrePanel(
                              title: 'ジャズバー',
                              imagePath: Assets.facility.jazz.path,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "エリアから検索",
                        style: textTheme.fs20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "マップで検索",
                        style: textTheme.fs20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "新着の施設",
                        style: textTheme.fs20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          10,
                          (index) => const NewFacilityPanel(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Text(
                        "ブックマーク済みの施設",
                        style: textTheme.fs20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          10,
                          (index) => const NewFacilityPanel(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                ...List.generate(
                  textSearchLiveHouse.candidates.length,
                  (index) => LiveHouseSuggest(
                    textSearch: textSearchLiveHouse.candidates[index],
                  ),
                )
              ],
            ),
    );
  }
}


          // Stack(
          //     children: [
          //       SingleChildScrollView(
          //         child: SizedBox(
          //           width: size.width,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "タイプ別",
          //                   maxLines: 1,
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: List.generate(
          //                   FacilityType.values.length,
          //                   (index) => FilterChipFacility(
          //                     facilityType: FacilityType.values[index],
          //                     facilityValue: facilityValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "北海道・東北",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   7,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "関東",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   7,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 7],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "北陸・甲信越",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   6,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 14],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "東海",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   4,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 20],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "近畿",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   6,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 24],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "中国・四国",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   9,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 30],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 10),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 5),
          //                 child: Text(
          //                   "九州・沖縄",
          //                   style: textTheme.fs16.copyWith(
          //                     fontWeight: FontWeight.bold,
          //                     color: HexColor("EFEFEF"),
          //                   ),
          //                 ),
          //               ),
          //               Wrap(
          //                 children: List.generate(
          //                   8,
          //                   (index) => FilterChipPrefecture(
          //                     prefecture:
          //                         searchLiveHouseCTL.prefectureList[index + 39],
          //                     prefectureValue: prefectureValue,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 100),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Align(
          //         alignment: const Alignment(0, 1),
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             InkWell(
          //               onTap: () async {
          //                 context.pushNamed(
          //                   Routes.name().searchResult,
          //                   extra: {
          //                     "facilityValue": facilityValue.value,
          //                     "prefectureValue": prefectureValue.value,
          //                   },
          //                 );
          //               },
          //               child: Container(
          //                 width: double.infinity,
          //                 padding: const EdgeInsets.symmetric(vertical: 10),
          //                 margin: const EdgeInsets.symmetric(
          //                   horizontal: 15,
          //                   vertical: 10,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   color: HexColor("FFFFFF"),
          //                   borderRadius: BorderRadius.circular(100),
          //                 ),
          //                 child: Center(
          //                   child: Text(
          //                     "検索",
          //                     style: textTheme.fs16.copyWith(
          //                       fontWeight: FontWeight.bold,
          //                       color: HexColor("000000"),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   )