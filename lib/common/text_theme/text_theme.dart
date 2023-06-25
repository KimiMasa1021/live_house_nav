import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_house_nav/common/text_theme/font_size.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'text_theme.g.dart';

@Riverpod(keepAlive: true)
AppTextTheme myTextTheme(MyTextThemeRef ref) => AppTextTheme();

class AppTextTheme {
  AppTextTheme._({
    required this.fs10,
    required this.fs11,
    required this.fs12,
    required this.fs13,
    required this.fs14,
    required this.fs15,
    required this.fs16,
    required this.fs20,
    required this.fs24,
    required this.fs32,
    required this.fs36,
    required this.fs40,
    required this.fs48,
    required this.fs64,
    required this.fs96,
    required this.fs128,
  });
  final TextStyle fs10;
  final TextStyle fs11;
  final TextStyle fs12;
  final TextStyle fs13;
  final TextStyle fs14;
  final TextStyle fs15;
  final TextStyle fs16;
  final TextStyle fs20;
  final TextStyle fs24;
  final TextStyle fs32;
  final TextStyle fs36;
  final TextStyle fs40;
  final TextStyle fs48;
  final TextStyle fs64;
  final TextStyle fs96;
  final TextStyle fs128;

  factory AppTextTheme() {
    final normalRegular = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
    return AppTextTheme._(
      fs10: const TextStyle(fontSize: FontSize.pt10).merge(normalRegular),
      fs11: const TextStyle(fontSize: FontSize.pt11).merge(normalRegular),
      fs12: const TextStyle(fontSize: FontSize.pt12).merge(normalRegular),
      fs13: const TextStyle(fontSize: FontSize.pt13).merge(normalRegular),
      fs14: const TextStyle(fontSize: FontSize.pt14).merge(normalRegular),
      fs15: const TextStyle(fontSize: FontSize.pt15).merge(normalRegular),
      fs16: const TextStyle(fontSize: FontSize.pt16).merge(normalRegular),
      fs20: const TextStyle(fontSize: FontSize.pt20).merge(normalRegular),
      fs24: const TextStyle(fontSize: FontSize.pt24).merge(normalRegular),
      fs32: const TextStyle(fontSize: FontSize.pt32).merge(normalRegular),
      fs36: const TextStyle(fontSize: FontSize.pt36).merge(normalRegular),
      fs40: const TextStyle(fontSize: FontSize.pt40).merge(normalRegular),
      fs48: const TextStyle(fontSize: FontSize.pt48).merge(normalRegular),
      fs64: const TextStyle(fontSize: FontSize.pt64).merge(normalRegular),
      fs96: const TextStyle(fontSize: FontSize.pt96).merge(normalRegular),
      fs128: const TextStyle(fontSize: FontSize.pt128).merge(normalRegular),
    );
  }
}
