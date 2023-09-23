import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/hex_color.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../../gen/assets.gen.dart';

class ArticlesListPage extends ConsumerWidget {
  const ArticlesListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              ...List.generate(
                20,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: HexColor("2A2A2A"),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 190,
                                      child: Text(
                                        "君成田君成田君成田君成田君成田",
                                        style: textTheme.fs16.copyWith(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        "2023.06.12",
                                        style: textTheme.fs14.copyWith(
                                          color: HexColor("B8B8B8"),
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text("下北沢Shelter"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert_outlined),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト",
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.facility.jazz.path),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.facility.club.path),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Icon(Icons.people_alt_outlined),
                          Text("  突然少年、Zazen Boys,トリプルファイヤー"),
                        ],
                      ),
                      Divider(
                        color: HexColor("505050"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
