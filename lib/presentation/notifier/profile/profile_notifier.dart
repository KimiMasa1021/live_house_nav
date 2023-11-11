import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/profile/value/profile/profile.dart';

final usersStreamProvider = StreamProvider<Profile?>((ref) async* {
  final uid = FirebaseAuth.instance.currentUser?.uid ?? "";
  yield* FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .map(
    (doc) {
      if (doc.data()?["userId"] == null) return null;
      return Profile(
        userId: doc.data()?["userId"] ?? "",
        image: doc.data()?["image"] ?? "",
        name: doc.data()?["name"] ?? "",
      );
    },
  );
});
