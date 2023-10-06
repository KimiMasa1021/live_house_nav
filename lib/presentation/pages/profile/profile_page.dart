import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Text(FirebaseAuth.instance.currentUser!.displayName!),
            ),
            Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            InkWell(
              onTap: () async {
                // await FirebaseAuth.instance.verifyPhoneNumber(
                //   phoneNumber: '+817085782936',
                //   verificationCompleted: (PhoneAuthCredential credential) {
                //     debugPrint("");
                //   },
                //   verificationFailed: (FirebaseAuthException e) {
                //     debugPrint(e.message);
                //   },
                //   codeSent: (String verificationId, int? resendToken) {
                //     debugPrint("");
                //   },
                //   codeAutoRetrievalTimeout: (String verificationId) {
                //     debugPrint("");
                //   },
                // );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Text("ログイン"),
              ),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.name().signUp);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Text("新規登録"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
