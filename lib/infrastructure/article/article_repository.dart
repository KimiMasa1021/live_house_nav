import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:async/src/result/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        "minImageHeight": article.minImageHeight,
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

  @override
  Future<List<String>> postArticleImage(List<File> files) async {
    try {
      final storage = FirebaseStorage.instance;
      final List<String> sendUrls = [];
      for (var file in files) {
        final dateStr = DateTime.now().toString();
        final aaa = await storage.ref("a$dateStr.png").putFile(file);
        final imageUrl = await aaa.ref.getDownloadURL();
        sendUrls.add(imageUrl);
      }
      return sendUrls;
    } catch (e) {
      return [];
    }
  }

  Future<double> getImageMinHeight(List<String> urls) async {
    try {
      if (urls.isEmpty) return 1;
      double? minHeight;
      for (var url in urls) {
        final Image image = Image.network(url);
        final Completer<Size> completer = Completer<Size>();
        image.image.resolve(ImageConfiguration.empty).addListener(
          ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
              final ui.Image myImage = image.image;
              final Size size =
                  Size(myImage.width.toDouble(), myImage.height.toDouble());
              completer.complete(size);
            },
          ),
        );
        final size = await completer.future;
        final test = size.height / size.width;
        if (minHeight == null || test < minHeight) {
          minHeight = test;
        }
      }
      return minHeight ?? 1;
    } catch (e) {
      return 1;
    }
  }
}
