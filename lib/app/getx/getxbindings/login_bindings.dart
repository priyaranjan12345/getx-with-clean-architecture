import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/login_controller.dart/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(
        localRepositoryInterfasce: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );
  }
}
