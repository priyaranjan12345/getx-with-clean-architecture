import 'package:getx_clean_architecture/app/data/model/user.dart';

abstract class LocalRepositoryInterfasce {
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> clearAllData();
  Future<void> saveUser(User user);
  Future<User> getUser();
  Future<bool?> isDarkMode();
  Future<void> saveTheme(bool isDarkMode);
}
