import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/infrastructure/auth/auth_repository.dart';

import 'value/profile/profile.dart';

final profileSearviceProvider =
    Provider((ref) => ProfileSearvice(ref.read(authRepositoryProvider)));

class ProfileSearvice {
  ProfileSearvice(this.repository);
  final AuthRepository repository;

  Future<void> setUserInfo(Profile user) async {
    await repository.setUserInfo(user);
  }

  Future<List<Profile>> fetchProfileList(List<String> uidList) async {
    final result = await repository.fetchProfileList(uidList);

    return result;
  }
}
