import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await auth.currentUser!.updateDisplayName(name);
      await sendVerifyMail();
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
}
