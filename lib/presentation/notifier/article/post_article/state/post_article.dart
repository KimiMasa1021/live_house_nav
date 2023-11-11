import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/presentation/notifier/spotify/search_artists/state/artists.dart';

part 'post_article.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class PostArticle with _$PostArticle {
  factory PostArticle({
    @Default([]) List<File> pickedImages,
    required Artists artists,
    @Default("") String text,
  }) = _PostArticle;
}
