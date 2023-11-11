import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';

import '../../../domain/profile/value/profile/profile.dart';
import '../../notifier/profile/profile_list_notifier.dart';
import '../../notifier/profile/profile_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            final profile = ref.watch(usersStreamProvider);

            return profile.maybeWhen(
              data: (user) {
                return Column(
                  children: [
                    Text(user?.name ?? ""),
                  ],
                );
              },
              orElse: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.name().signUp);
                },
                child: Text("新規"),
              ),
            ],
          );
        },
      )),
    );
  }
}
