import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Profile with _$Profile {
  factory Profile({
    @Default("") String userId,
    @Default("") String name,
    @Default("") String image,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
