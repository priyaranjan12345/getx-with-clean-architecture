import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/home_controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        localRepositoryInterfasce: Get.find(),
        apiRepositoryInterface: Get.find(),
      ),
    );
  }
}
