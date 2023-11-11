import 'values/article.dart';
import 'package:async/async.dart';

abstract class ArticleRepositoryBase {
  Future<void> postArticle(Article article);
  Future<Result<List<Article>>> featchArticles();
}
