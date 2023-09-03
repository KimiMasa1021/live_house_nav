import 'package:freezed_annotation/freezed_annotation.dart';
part 'text_search.freezed.dart';
part 'text_search.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class TextSearch with _$TextSearch {
  factory TextSearch({
    @Default("") String name,
    @Default("") String place_id,
  }) = _TextSearch;

  factory TextSearch.fromJson(Map<String, dynamic> json) =>
      _$TextSearchFromJson(json);
}
