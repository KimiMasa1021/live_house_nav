import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_house_nav/domain/article/values/article.dart';
import 'package:live_house_nav/domain/facility_detail/values/facility_detail/facility_detail.dart';
import 'package:live_house_nav/presentation/notifier/article/post_article/state/post_article.dart';

import '../../infrastructure/article/article_repository.dart';

class ArticleSearvice {
  ArticleSearvice(this.repository);
  final ArticleRepository repository;

  Future<void> postArticle(
    PostArticle postArticle,
    String text,
    FacilityDetail facilityDetail,
  ) async {
    final userName = FirebaseAuth.instance.currentUser?.displayName;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final article = Article(
      images: [],
      artists: postArticle.artists.items,
      placeId: facilityDetail.placeId,
      facilityName: facilityDetail.name,
      text: text,
      userId: userId ?? "",
      userName: userName ?? "",
      userImage: "https://www.tv-asahi.co.jp/doraemon/cast/img/doraemon.jpg",
      createdAt: DateTime.now(),
      eventedAt: DateTime.now(),
    );
    await repository.postArticle(article);
  }

  Future<List<Article>> featchArticles() async {
    final result = await repository.featchArticles();

    if (result.isError) return [];
    return await result.asFuture;
  }
}
