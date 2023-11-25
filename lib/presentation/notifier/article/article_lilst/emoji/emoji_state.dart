import 'package:freezed_annotation/freezed_annotation.dart';
part 'emoji_state.freezed.dart';
part 'emoji_state.g.dart';

@freezed
class EmojiState with _$EmojiState {
  factory EmojiState({
    @Default("") String articleRef,
    @Default("") String docId,
    @Default("") String emoji,
    @Default([]) List<String> userList,
  }) = _EmojiState;

  factory EmojiState.fromJson(Map<String, dynamic> json) =>
      _$EmojiStateFromJson(json);
}
