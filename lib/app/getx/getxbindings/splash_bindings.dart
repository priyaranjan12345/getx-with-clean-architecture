import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/splash_controller.dart/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(
        localRepositoryInterfasce: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );
  }
}
