import 'dart:io';

import 'values/article.dart';
import 'package:async/async.dart';

abstract class ArticleRepositoryBase {
  Future<List<String>> postArticleImage(List<File> files);
  Future<void> postArticle(Article article);
  Future<Result<List<Article>>> featchArticles();
}
