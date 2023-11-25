import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/article/values/article.dart';
import 'package:live_house_nav/presentation/notifier/article/article_lilst/emoji/emoji_state.dart';

import '../../../../infrastructure/article/article_repository.dart';

final articleStreamProvider =
    StreamProvider.family<Stream<List<Article>>, Article?>(
        (ref, lastItem) async* {
  const limit = 10;

  yield ref
      .watch(articleRepositoryProvider)
      .subscribeMessages(lastItem: lastItem, limit: limit);
});

final testArticleNotifierProvider =
    AsyncNotifierProvider<TestArticleNotifier, List<Article>>(
        () => TestArticleNotifier());

class TestArticleNotifier extends AsyncNotifier<List<Article>> {
  @override
  build() async {
    final aaa = ref.watch(articleStreamProvider(null));
    if (aaa.isLoading) {
      return [];
    } else {
      aaa.requireValue.listen(updatePastMessages);
    }
    return [];
  }

  void updatePastMessages(List<Article> pastMessages) {
    state = AsyncValue.data(pastMessages);
  }

  Future<void> addOrDeleteStamp(EmojiState emojiState, String uid) async {
    if (emojiState.userList.contains(uid)) {
      if (emojiState.userList.length == 1) {
        // スタンプ1 → emojiドキュメント削除
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
    String articleRef,
  ) async {
    for (EmojiState emoji in emojis) {
      if (emoji.emoji == selectedEmoji) {
        if (emoji.userList.contains(uid)) {
          // スタンプ1 → emojiドキュメント削除
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
      articleRef: articleRef,
      emoji: selectedEmoji,
      userList: [uid],
    );
    await ref.watch(articleRepositoryProvider).newStamp(stamp);
  }
}
