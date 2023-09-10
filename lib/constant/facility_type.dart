import 'package:flutter/material.dart';

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

  String get displayName => displayNames[this]!;
  String get name => names[this]!;
}
