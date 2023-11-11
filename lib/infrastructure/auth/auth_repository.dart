import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/profile/profile_repository_base.dart';
import '../../domain/profile/value/profile/profile.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository extends ProfileRepositoryBase {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> setUserInfo(Profile user) async {
    try {
      await db.collection("users").doc(user.userId).set(user.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<Profile>> fetchProfileList(List<String> uidList) async {
    try {
      final collectionReference = db.collection("users").withConverter<Profile>(
            fromFirestore: (snapshot, _) => Profile.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

      final querySnapshot =
          await collectionReference.where("userId", whereIn: uidList).get();
      final result = querySnapshot.docs.map((e) => e.data()).toList();
      return result;
    } catch (e) {
      debugPrint("${e}");
      return [];
    }
  }
}
