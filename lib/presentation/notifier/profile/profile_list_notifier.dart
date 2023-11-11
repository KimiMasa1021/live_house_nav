import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/domain/profile/profile_searvice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/profile/value/profile/profile.dart';

final profileListProvider = FutureProvider.family
    .autoDispose<List<Profile>, String>((ref, String arg) async {
  final result =
      await ref.read(profileSearviceProvider).fetchProfileList([arg]);
  debugPrint(result.toString());
  return result;
});


// final profileListNotifierProvider = AsyncNotifierProviderFamily<
//     ProfileListNotifier,
//     List<Profile>,
//     List<String>>(() => ProfileListNotifier());

// class ProfileListNotifier
//     extends FamilyAsyncNotifier<List<Profile>, List<String>> {
//   @override
//   FutureOr<List<Profile>> build(List<String> arg) async {
//     final aaa = await ref.read(profileSearviceProvider).fetchProfileList(arg);
//     debugPrint(aaa.toString());
//     return aaa;
//   }
// }
