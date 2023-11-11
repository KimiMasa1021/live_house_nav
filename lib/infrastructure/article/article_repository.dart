import 'package:async/src/result/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:live_house_nav/domain/article/article_repository_base.dart';
import 'package:live_house_nav/domain/article/values/article.dart';

class ArticleRepository extends ArticleRepositoryBase {
  final db = FirebaseFirestore.instance;
  QueryDocumentSnapshot<Article>? lastItem;

  @override
  Future<void> postArticle(Article article) async {
    try {
      final artists = article.artists;
      await db.collection("articles").add({
        "images": article.images,
        "artists": List.generate(
          artists.length,
          (index) => {
            "id": artists[index].id,
            "name": artists[index].name,
            "images": artists[index].images.isNotEmpty
                ? List.generate(
                    artists[index].images.length,
                    (imageIndex) => {
                      "url": artists[index].images[imageIndex].url,
                    },
                  )
                : [],
          },
        ),
        "placeId": article.placeId,
        "facilityName": article.facilityName,
        "text": article.text,
        "userId": article.userId,
        "userName": article.userName,
        "userImage": article.userImage,
        "createdAt": article.createdAt,
        "eventedAt": article.eventedAt,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Result<List<Article>>> featchArticles() async {
    try {
      final CollectionReference<Article> collectionReference = db
          .collection('articles')
          .withConverter<Article>(
            fromFirestore: (snapshot, _) => Article.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

      final querySnapshot =
          await collectionReference.orderBy("createdAt").limit(20).get();
      if (querySnapshot.docs.isNotEmpty) lastItem = querySnapshot.docs.last;

      return Result.value(querySnapshot.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Result.error(e);
    }
  }
}
