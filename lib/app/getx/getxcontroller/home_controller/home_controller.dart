import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/model/user.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/local_data.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterfasce localRepositoryInterfasce;
  final ApiRepositoryInterface apiRepositoryInterface;

  HomeController({
    required this.localRepositoryInterfasce,
    required this.apiRepositoryInterface,
  });

  final currentIndex = 0.obs;
  final isDarkTheme = false.obs;

  Rx<User> user = const User(
          name: 'No Name provided',
          username: 'no user name provided',
          imagePath: 'assets/img/six.png')
      .obs;

  Future<void> loadUser() async {
    localRepositoryInterfasce.getUser().then(
      (value) {
        user(value);
      },
    );
  }

  Future<void> loadCurrentTheme() async {
    final isDarkModeEnabled = await localRepositoryInterfasce.isDarkMode();
    if (isDarkModeEnabled != null) {
      await localRepositoryInterfasce.isDarkMode().then(
            (value) => isDarkTheme(value),
          );
      if (isDarkModeEnabled) {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
      }
    } else {
      isDarkTheme.value = Get.isPlatformDarkMode;
    }
  }

  Future<void> updateTheme(bool isDark) async {
    isDarkTheme(isDark);
    await localRepositoryInterfasce.saveTheme(isDark);
    await loadCurrentTheme();
  }

  void updateCurrentIndex(int index) {
    currentIndex(index);
  }

  Future<void> logout() async {
    final token = await localRepositoryInterfasce.getToken();
    await apiRepositoryInterface.logout(token!);
    await localRepositoryInterfasce.clearAllData();
  }

  @override
  void onReady() async {
    await loadCurrentTheme();
    await loadUser();
    super.onInit();
  }
}
