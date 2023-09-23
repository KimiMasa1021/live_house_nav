import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/gen/assets.gen.dart';
import 'package:live_house_nav/presentation/notifier/facility/new_facility/new_facility_notifier.dart';
import 'package:live_house_nav/presentation/pages/search/widgets/genre_panel.dart';
import 'package:live_house_nav/presentation/pages/widgets/live_house_search_bar.dart';
import '../../../common/go_router_provider/routes/routes.dart';
import '../../../common/text_theme/text_theme.dart';
import '../../../constant/facility_type.dart';
import '../page_root.dart';
import 'widgets/fake_search_bar.dart';
import 'widgets/new_facility_panel.dart';
import 'widgets/search_method_bar.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = ref.watch(myTextThemeProvider);
    final newFacility = ref.watch(newFacilityNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const FakeSearchBar(),
      ),
      body: SingleChildScrollView(
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
                        facilityType: FacilityType.hole,
                        imagePath: Assets.facility.hole.path,
                      ),
                      GenrePanel(
                        facilityType: FacilityType.arena,
                        imagePath: Assets.facility.aina.path,
                      ),
                      GenrePanel(
                        facilityType: FacilityType.club,
                        imagePath: Assets.facility.club.path,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      GenrePanel(
                        facilityType: FacilityType.liveHoue,
                        imagePath: Assets.facility.liveHouse.path,
                      ),
                      GenrePanel(
                        facilityType: FacilityType.jazzBar,
                        imagePath: Assets.facility.jazz.path,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SearchMethodBar(
                text: "エリアから検索",
                onTap: () {},
              ),
              SearchMethodBar(
                text: "マップで検索",
                onTap: () {
                  context.goNamed(Routes.name().liveHouseMap);
                },
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
              newFacility.maybeWhen(
                data: (data) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        data.length,
                        (index) => NewFacilityPanel(
                          liveHouse: data[index],
                        ),
                      ),
                    ),
                  );
                },
                orElse: () {
                  return const Text("Loading...");
                },
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
              newFacility.maybeWhen(
                data: (data) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        data.length,
                        (index) => NewFacilityPanel(
                          liveHouse: data[index],
                        ),
                      ),
                    ),
                  );
                },
                orElse: () {
                  return const Text("Loading...");
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
    // final textSearchLiveHouse = ref.watch(textSearchNotifierProvider);


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