import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';

class ProductController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductController({
    required this.apiRepositoryInterface,
  });

  final productList = [].obs;
  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList(result);
  }

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  /**
   * 
   * if this is only list from api GetView<T> with stateMixin is best;
   * so that we can implement onError() and onLoad() -- skeliton ;)
   */
}
