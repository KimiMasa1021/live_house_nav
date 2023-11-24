import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../spotify/values/artist/artist.dart';

part 'article.freezed.dart';
part 'article.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Article with _$Article {
  factory Article({
    @Default([]) List<String> images,
    @Default([]) List<Artist> artists,
    @Default("") String placeId,
    @Default("") String facilityName,
    @Default("") String text,
    @Default("") String userId,
    @Default("") String userName,
    @Default("") String userImage,
    @Default(0) double minImageHeight,
    @UpdatedAtField() DateTime? createdAt,
    @UpdatedAtField() DateTime? eventedAt,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}
