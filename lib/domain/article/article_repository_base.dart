import 'dart:io';

import '../../presentation/notifier/article/article_lilst/emoji/emoji_state.dart';
import 'values/article.dart';
import 'package:async/async.dart';

abstract class ArticleRepositoryBase {
  Future<List<String>> postArticleImage(List<File> files);
  Future<void> postArticle(Article article);
  Future<Result<List<Article>>> featchArticles();
  Stream<List<Article>> subscribeMessages({
    required Article lastItem,
    required int limit,
  });
  Stream<List<EmojiState>> subscribeArticleEmoji({
    required String articleId,
  });
  Future<void> editStampInfo(EmojiState emojiState);
  Future<void> removeStamp(EmojiState emojiState);
  Future<void> newStamp(EmojiState emojiState);
}
