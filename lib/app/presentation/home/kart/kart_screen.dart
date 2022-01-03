import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/model/product.dart';
import 'package:getx_clean_architecture/app/data/products_list/product_list.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/home_controller/home_controller.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';

class KartScreen extends StatelessWidget {
  const KartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productList.isEmpty ? const _EmptyKart() : const _FullKart(),
    );
  }
}

class _FullKart extends StatelessWidget {
  const _FullKart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 40,
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemExtent: 280,
              itemBuilder: (context, index) {
                return _ItemProduct(
                  product: productList[index],
                  onDelete: () {},
                  onInc: () {},
                  onDec: () {},
                );
              },
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: _BillInformation(),
        ),
      ],
    );
  }
}

class _BillInformation extends StatelessWidget {
  const _BillInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 20,
      ),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        Text(
                          '6 Items',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charge',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        Text(
                          '+ 60 INR',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        Text(
                          '- 60 INR',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        Text(
                          '725 INR',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 54,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Proceed to payment',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: BorderSide(
                      width: 1.60,
                      color: Theme.of(context).splashColor,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;
  final VoidCallback onInc;
  final VoidCallback onDec;
  const _ItemProduct(
      {Key? key,
      required this.product,
      required this.onDelete,
      required this.onInc,
      required this.onDec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Theme.of(context).bottomAppBarColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(product.imagePath!),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: onDec,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: DeliveryColors.green,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 26,
                                    width: 26,
                                    child: const Icon(
                                      Icons.remove,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '1 ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontSize: 16),
                                  ),
                                ),
                                InkWell(
                                  onTap: onInc,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: DeliveryColors.purple,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 26,
                                    width: 26,
                                    child: const Icon(
                                      Icons.add,
                                      size: 24,
                                      color: DeliveryColors.veryLightGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₹ ' + product.price,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 15,
          child: MaterialButton(
            onPressed: onDelete,
            color: DeliveryColors.pink,
            textColor: DeliveryColors.white,
            child: const Icon(
              Icons.clear,
              size: 22,
            ),
            shape: const CircleBorder(),
          ),
        ),
      ],
    );
  }
}

class _EmptyKart extends GetView<HomeController> {
  const _EmptyKart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => controller.updateCurrentIndex(0),
            child: const Text('Go to products'),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
