import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/hex_color.dart';
import '../../notifier/facility/search_by_text/search_by_text.dart';

class LiveHouseSearchBar extends HookConsumerWidget {
  const LiveHouseSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final searchTextController = useTextEditingController(text: "");
    final textSearchLiveHouseCTL =
        ref.watch(searchByTextNotifierProvider.notifier);
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
              controller: searchTextController,
              decoration: const InputDecoration(
                hintText: "エリア・施設名・キーワード",
                border: InputBorder.none,
              ),
              autofocus: true,
              onChanged: (text) async {
                await textSearchLiveHouseCTL.searchLiveHoue(text);
              },
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
    );
  }
}
