import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/search_artists_notifier.dart';

import '../../../../common/hex_color.dart';
import '../../../notifier/article/post_article/post_article_notifier.dart';

class SetArtistsPage extends HookConsumerWidget {
  const SetArtistsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchArtists = ref.watch(searchArtistsNotifierProvider);
    final searchArtistsNotifier =
        ref.watch(searchArtistsNotifierProvider.notifier);
    final size = MediaQuery.of(context).size;
    final textController = useTextEditingController(text: "");
    final isSearch = useState(false);
    final postArticleNotifier = ref.watch(postArticleNotifierProvider.notifier);
    final postArticle = ref.watch(postArticleNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: isSearch.value
                  ? searchArtists.when(
                      data: (artists) {
                        return ListView.builder(
                          itemCount: artists.items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                postArticleNotifier
                                    .addArtist(artists.items[index]);
                                textController.clear();
                                searchArtistsNotifier.clearState();
                                isSearch.value = false;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          artists.items[index].images.isNotEmpty
                                              ? NetworkImage(artists
                                                  .items[index].images[0].url)
                                              : null,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        artists.items[index].name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.add,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (e, s) {
                        return const Text("エラー");
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  : Column(
                      children: List.generate(
                        postArticle.artists.items.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: postArticle
                                        .artists.items[index].images.isNotEmpty
                                    ? NetworkImage(postArticle
                                        .artists.items[index].images[0].url)
                                    : null,
                              ),
                              const SizedBox(width: 10),
                              Text(postArticle.artists.items[index].name),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  postArticleNotifier.removeArtist(
                                      postArticle.artists.items[index]);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: "アーティスト名",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    onChanged: (text) async {
                      isSearch.value = true;
                      await searchArtistsNotifier.fetchArtists(text);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close_rounded),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
