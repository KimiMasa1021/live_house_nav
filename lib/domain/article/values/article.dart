import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../spotify/values/artist/artist.dart';

part 'article.freezed.dart';
part 'article.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Article with _$Article {
  @JsonSerializable(explicitToJson: true)
  factory Article({
    @Default([]) List<String> images,
    @Default([]) List<Artist> artists,
    @Default("") String placeId,
    @Default("") String facilityName,
    @Default("") String text,
    @Default("") String userId,
    @Default("") String docId,
    @Default([]) List<String> emojis,
    @Default(0) double minImageHeight,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? eventedAt,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic time) {
    time as Timestamp;
    return time.toDate();
  }

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}
