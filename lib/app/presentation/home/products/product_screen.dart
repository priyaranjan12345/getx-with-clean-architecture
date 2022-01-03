import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/model/product.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/product_controller.dart/product_controller.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(12.0),
          child: controller.productList.isEmpty
              ? const Center(
                  child: Text('No Items'),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return _ItemProduct(product: controller.productList[index]);
                  },
                ),
        ),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  const _ItemProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Theme.of(context).bottomAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(product.imagePath!),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Price : ' + product.price + ' INR',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).splashColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
