import 'package:freezed_annotation/freezed_annotation.dart';

import '../image/image.dart';
part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  factory Artist({
    @Default("") String id,
    @Default("") String name,
    @Default([]) List<Image> images,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
