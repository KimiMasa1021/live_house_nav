import 'dart:io';

import '../../presentation/notifier/article/article_lilst/emoji/emoji_state.dart';
import 'values/article.dart';

abstract class ArticleRepositoryBase {
  Future<List<String>> postArticleImage(List<File> files);
  Future<void> postArticle(Article article);
  Future<List<Article>> featchArticles(
    Article? lastItem, {
    required int limit,
  });
  Future<List<Article>> featchNewArticles(Article fastItem);
  Stream<List<Article>> subscribeNewArticleNotification({Article? lastItem});
  Stream<List<EmojiState>> subscribeArticleEmoji({
    required String articleId,
  });
  Future<void> editStampInfo(EmojiState emojiState);
  Future<void> removeStamp(EmojiState emojiState);
  Future<void> newStamp(EmojiState emojiState);
  Future<void> editArticleEmoji(Article article);
}
