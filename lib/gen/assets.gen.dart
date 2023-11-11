/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsCommonGen {
  const $AssetsCommonGen();

  /// File path: assets/common/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/common/profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [profile];
}

class $AssetsFacilityGen {
  const $AssetsFacilityGen();

  /// File path: assets/facility/aina.jpg
  AssetGenImage get aina => const AssetGenImage('assets/facility/aina.jpg');

  /// File path: assets/facility/club.jpg
  AssetGenImage get club => const AssetGenImage('assets/facility/club.jpg');

  /// File path: assets/facility/hole.jpg
  AssetGenImage get hole => const AssetGenImage('assets/facility/hole.jpg');

  /// File path: assets/facility/jazz.jpg
  AssetGenImage get jazz => const AssetGenImage('assets/facility/jazz.jpg');

  /// File path: assets/facility/liveHouse.jpg
  AssetGenImage get liveHouse =>
      const AssetGenImage('assets/facility/liveHouse.jpg');

  /// File path: assets/facility/no_image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/facility/no_image.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [aina, club, hole, jazz, liveHouse, noImage];
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/google_map_style.json
  String get googleMapStyle => 'assets/jsons/google_map_style.json';

  /// List of all assets
  List<String> get values => [googleMapStyle];
}

class Assets {
  Assets._();

  static const $AssetsCommonGen common = $AssetsCommonGen();
  static const $AssetsFacilityGen facility = $AssetsFacilityGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
