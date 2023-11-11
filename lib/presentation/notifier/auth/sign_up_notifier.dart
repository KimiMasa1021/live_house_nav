import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/profile/profile_searvice.dart';
import '../../../domain/profile/value/profile/profile.dart';

final signUpNotifierProvider = AsyncNotifierProvider(() => SignUpNotifier());

class SignUpNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}
  final auth = FirebaseAuth.instance;

  Future<String?> signUp(
    String email,
    String password,
    String name,
    Function() transitionWaitScreen,
  ) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendVerifyMail();
      await setUserInfo(name, credential.user?.uid ?? "");
      transitionWaitScreen();
    } catch (e) {
      return "";
    }
    return null;
  }

  Future<void> sendVerifyMail() async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } catch (e) {}
  }

  Future<void> setUserInfo(
    String userName,
    String userId,
  ) async {
    final user = Profile(
      name: userName,
      userId: userId,
    );
    await ref.read(profileSearviceProvider).setUserInfo(user);
  }
}
