import 'value/profile/profile.dart';

abstract class ProfileRepositoryBase {
  Future<void> setUserInfo(Profile user);
  Future<List<Profile>> fetchProfileList(List<String> uidList);
}
