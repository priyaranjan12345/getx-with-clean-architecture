import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/model/kart.dart';
import 'package:getx_clean_architecture/app/data/model/product.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';

class KartController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  KartController({
    required this.apiRepositoryInterface,
  });

  final RxList<Product> kartProductList = <Product>[].obs;
  final itemsQty = <Kart>[].obs;
  Future<void> loadKartProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    kartProductList(result);
  }

  void addKartProduct(Product product) {
    kartProductList.add(product);
  }

  void removeKartProduct(Product product) {
    kartProductList.remove(product);
  }

  void loadKartProductsQty() async {
    await loadKartProducts();
    if (kartProductList.isNotEmpty) {
      Map<Product, int> itemQtyMap = {};
      // calulate duplicate items
      for (Product i in kartProductList) {
        itemQtyMap[i] = (itemQtyMap[i] ?? 0) + 1;
      }
      itemsQty.value = itemQtyMap.entries
          .map((item) => Kart(product: item.key, noOfItem: item.value))
          .toList();
    }
  }

  @override
  void onInit() {
    loadKartProducts();
    super.onInit();
  }

  /**
   * 
   * if this is only list from api GetView<T> with stateMixin is best;
   * so that we can implement onError() and onLoad() -- skeliton ;)
   */

}
