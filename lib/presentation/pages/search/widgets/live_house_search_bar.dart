import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/hex_color.dart';

import '../../../notifier/text_search/text_search_notifier.dart';

class LiveHouseSearchBar extends ConsumerWidget {
  const LiveHouseSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final searchTextController = TextEditingController(text: "");
    final textSearchLiveHouseCTL =
        ref.watch(textSearchNotifierProvider.notifier);
    return Container(
      width: size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: HexColor("131313"),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: HexColor("4B4B4B"),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "エリア・施設名・キーワード",
                border: InputBorder.none,
              ),
              autofocus: false,
              onChanged: (text) async {
                textSearchLiveHouseCTL.searchLiveHoue(text);
              },
              controller: searchTextController,
            ),
          ),
          InkWell(
            onTap: () {
              searchTextController.text = "";
              textSearchLiveHouseCTL.clearState();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.close_rounded),
            ),
          )
        ],
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 20),
      //       child: Text(
      //         "施設名で検索",
      //         style: textTheme.fs16.copyWith(
      //           color: HexColor("757575"),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       width: 60,
      //       height: 50,
      //       decoration: BoxDecoration(
      //         color: HexColor("242424"),
      //         borderRadius: const BorderRadius.only(
      //           topRight: Radius.circular(45),
      //           bottomRight: Radius.circular(45),
      //         ),
      //         border: Border.all(
      //           color: HexColor("4B4B4B"),
      //         ),
      //       ),
      //       child: Icon(
      //         Icons.search,
      //         size: 25,
      //         color: HexColor("EFEFEF"),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
