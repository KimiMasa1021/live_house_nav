import '../gen/assets.gen.dart';

enum FacilityType {
  liveHoue,
  jazzBar,
  hole,
  arena,
  club,
}

extension FacilityTypeExtension on FacilityType {
  static final displayNames = {
    FacilityType.liveHoue: "ライブハウス",
    FacilityType.jazzBar: "ジャズバー",
    FacilityType.hole: "ホール",
    FacilityType.arena: "アリーナ",
    FacilityType.club: "クラブ",
  };

  static final names = {
    FacilityType.liveHoue: "liveHouse",
    FacilityType.jazzBar: "jazzBar",
    FacilityType.hole: "hole",
    FacilityType.arena: "arena",
    FacilityType.club: "club",
  };

  static final imagePaths = {
    FacilityType.liveHoue: Assets.facility.liveHouse.path,
    FacilityType.jazzBar: Assets.facility.jazz.path,
    FacilityType.hole: Assets.facility.hole.path,
    FacilityType.arena: Assets.facility.aina.path,
    FacilityType.club: Assets.facility.club.path,
  };

  String get displayName => displayNames[this]!;
  String get name => names[this]!;
  String get imagePath => imagePaths[this]!;
}
