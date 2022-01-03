import 'package:getx_clean_architecture/app/data/model/user.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

//all local storage access will come to here
class LocalRespositoryImplements extends LocalRepositoryInterfasce {
  final _prefToken = 'Token';
  final _prefUsername = 'Username';
  final _prefImgPath = 'assets/img/one.png';
  final _prefName = 'Name';
  final _prefIsDarkMode = 'isDarkTheme';

  //we can save here dark mode

  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefToken);
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefToken, token);
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString(_prefName);
    final username = sharedPreferences.getString(_prefUsername);
    final image = sharedPreferences.getString(_prefImgPath);
    User user = const User(
        name: 'No Name provided',
        username: 'no user name provided',
        imagePath: 'assets/img/six.png');

    if (name != null) {
      user = User(name: name, username: username!, imagePath: image);
    }
    return user;
  }

  @override
  Future<void> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefName, user.name);
    sharedPreferences.setString(_prefUsername, user.username);
    sharedPreferences.setString(_prefImgPath, user.imagePath!);
  }

  @override
  Future<bool?> isDarkMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_prefIsDarkMode);
  }

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_prefIsDarkMode, isDarkMode);
  }
}
