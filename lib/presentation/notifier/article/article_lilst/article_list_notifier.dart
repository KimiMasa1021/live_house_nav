import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/article/values/article.dart';
import 'package:live_house_nav/presentation/notifier/article/article_lilst/emoji/emoji_state.dart';

import '../../../../infrastructure/article/article_repository.dart';

final testArticleNotifierProvider =
    AsyncNotifierProvider<TestArticleNotifier, List<Article>>(
        () => TestArticleNotifier());

class TestArticleNotifier extends AsyncNotifier<List<Article>> {
  Article? lastArticle;
  final int articleLimit = 10;
  bool isLast = false;
  @override
  build() async {
    final articleList = await ref
        .watch(articleRepositoryProvider)
        .featchArticles(lastArticle, limit: articleLimit);

    lastArticle = articleList.last;
    return articleList;
  }

  Future<void> fetchNextArticles() async {
    if (isLast) return;
    final articleList = await ref
        .watch(articleRepositoryProvider)
        .featchArticles(lastArticle, limit: articleLimit);

    if (articleList.length < articleLimit) {
      isLast = true;
    }

    state = AsyncValue.data([...state.value!, ...articleList]);
  }

  Future<void> fetchNewArticles() async {
    final articleList = await ref
        .watch(articleRepositoryProvider)
        .featchNewArticles(state.value!.first);

    state = AsyncValue.data([
      ...articleList,
      ...state.value!,
    ]);
  }

  Future<void> addOrDeleteStamp(
    EmojiState emojiState,
    String uid,
    Article article,
  ) async {
    if (emojiState.userList.contains(uid)) {
      if (emojiState.userList.length == 1) {
        // スタンプ1 → emojiドキュメント削除
        final List<String> newEmojis = List.from(article.emojis);
        newEmojis.remove(emojiState.emoji);
        await ref.watch(articleRepositoryProvider).removeStamp(emojiState);
      } else {
        // スタンプ数 1以上　→ userListから消す
        final List<String> newUserList = List.from(emojiState.userList);
        newUserList.remove(uid);
        final emoji = emojiState.copyWith(userList: newUserList);
        await ref.watch(articleRepositoryProvider).editStampInfo(emoji);
      }
    } else {
      // 既存スタンプ + 1
      final emoji =
          emojiState.copyWith(userList: [...emojiState.userList, uid]);
      await ref.watch(articleRepositoryProvider).editStampInfo(emoji);
    }
  }

  Future<void> onTapEmojiSlecter(
    String selectedEmoji,
    List<EmojiState> emojis,
    String uid,
    Article article,
  ) async {
    for (EmojiState emoji in emojis) {
      if (emoji.emoji == selectedEmoji) {
        if (emoji.userList.contains(uid)) {
          // スタンプ1 → emojiドキュメント削除
          final List<String> newEmojis = List.from(article.emojis);
          newEmojis.remove(selectedEmoji);
          await ref.watch(articleRepositoryProvider).removeStamp(emoji);
          return;
        } else {
          // 既存スタンプ + 1
          final newEmoji = emoji.copyWith(userList: [...emoji.userList, uid]);
          await ref.watch(articleRepositoryProvider).editStampInfo(newEmoji);
          return;
        }
      }
    }
    //新規スタンプ
    final stamp = EmojiState(
      articleRef: article.docId,
      emoji: selectedEmoji,
      userList: [uid],
    );
    await ref.watch(articleRepositoryProvider).newStamp(stamp);
  }
}
