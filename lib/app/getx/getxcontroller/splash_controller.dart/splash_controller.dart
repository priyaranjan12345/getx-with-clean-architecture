import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/local_data.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterfasce localRepositoryInterfasce;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController({
    required this.localRepositoryInterfasce,
    required this.apiRepositoryInterface,
  });

  void validateSesstioin() async {
    try {
      final token = await localRepositoryInterfasce.getToken();
      if (token != null) {
        final user = await apiRepositoryInterface.getUserFormToken(token);
        await localRepositoryInterfasce.saveUser(user);
        Get.toNamed(DeliveryRoutes.home);
      } else {
        Get.toNamed(DeliveryRoutes.login);
      }
    } catch (_) {
      log('error in token validation and going to login screen');
      Get.toNamed(DeliveryRoutes.login);
    }
  }

  @override
  void onReady() {
    validateSesstioin();
    super.onReady();
  }
}
