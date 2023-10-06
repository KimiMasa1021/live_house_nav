import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_article.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class PostArticle with _$PostArticle {
  factory PostArticle({
    @Default([]) List<File> pickedImages,
  }) = _PostArticle;
}
