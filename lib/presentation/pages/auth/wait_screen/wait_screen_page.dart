import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';

class WaitScreenPage extends StatelessWidget {
  const WaitScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        context.goNamed(Routes.name().profile);
      }
    });
    return const Scaffold(
      body: Center(
        child: Text("認証待ち..."),
      ),
    );
  }
}
