import 'package:freezed_annotation/freezed_annotation.dart';
import 'value/text_search.dart';
part 'live_house_suggests.freezed.dart';
part 'live_house_suggests.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class LiveHoueSuggests with _$LiveHoueSuggests {
  factory LiveHoueSuggests({
    @Default([]) List<TextSearch> candidates,
  }) = _LiveHoueSuggests;

  factory LiveHoueSuggests.fromJson(Map<String, dynamic> json) =>
      _$LiveHoueSuggestsFromJson(json);
}
