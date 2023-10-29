import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_house_nav/domain/spotify/values/artist/artist.dart';

part 'artists.freezed.dart';
part 'artists.g.dart';

@freezed
class Artists with _$Artists {
  factory Artists({
    @Default([]) List<Artist> items,
  }) = _Artists;

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);
}
