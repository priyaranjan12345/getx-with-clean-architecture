import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/kart_controller.dart/kart_controller.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/product_controller.dart/product_controller.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ProductController(
        apiRepositoryInterface: Get.find(),
      ),
    );
    Get.put(
      KartController(
        apiRepositoryInterface: Get.find(),
      ),
    );
  }
}
