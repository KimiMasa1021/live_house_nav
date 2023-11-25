import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';

import '../../../common/text_theme/text_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../notifier/profile/profile_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);

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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: user?.image != ""
                                ? NetworkImage(user?.image ?? "")
                                : Image.asset(Assets.common.profile.path).image,
                            onBackgroundImageError: (exception, stackTrace) =>
                                Image.asset(Assets.common.profile.path).image,
                            radius: 26,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            user?.name ?? "ゲストユーザー",
                            style: textTheme.fs20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              orElse: () {
                return const Center(
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
                child: const Text("新規"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.name().signInPage);
                },
                child: const Text("ログイン"),
              ),
            ],
          );
        },
      )),
    );
  }
}
