import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/home_controller/home_controller.dart';
import 'package:getx_clean_architecture/app/presentation/home/kart/kart_screen.dart';
import 'package:getx_clean_architecture/app/presentation/home/products/product_screen.dart';
import 'package:getx_clean_architecture/app/presentation/home/profile/profile_screen.dart';
import 'package:getx_clean_architecture/app/presentation/home/settings/settings_screen.dart';
import 'package:getx_clean_architecture/app/presentation/home/store/store_screen.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          radius: 4,
          title: 'Hot Pepper',
          titleStyle: const TextStyle(
            fontSize: 20,
            color: DeliveryColors.purple,
            fontWeight: FontWeight.bold,
          ),
          content: const Text(
            'Hey do you want to exit',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              color: DeliveryColors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Hot Pepper'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: _homeController.currentIndex.value,
                  children: const [
                    ProductScreen(),
                    StoreScreen(),
                    ProfileScreen(),
                    KartScreen(),
                    SettingsScreen(),
                  ],
                ),
              ),
            ),
            Obx(
              () => _DeliveryNavigationBar(
                index: _homeController.currentIndex.value,
                onIndexSelected: (value) {
                  _homeController.updateCurrentIndex(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  const _DeliveryNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(
                child: Material(
                  shape: const CircleBorder(),
                  color: index == 0
                      ? DeliveryColors.lightGrey
                      : Theme.of(context).bottomAppBarColor,
                  child: IconButton(
                    onPressed: () => onIndexSelected(0),
                    icon: Icon(
                      Icons.home,
                      size: 34,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  shape: const CircleBorder(),
                  color: index == 1
                      ? DeliveryColors.lightGrey
                      : Theme.of(context).bottomAppBarColor,
                  child: IconButton(
                    onPressed: () => onIndexSelected(1),
                    icon: Icon(
                      Icons.store,
                      size: 34,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => onIndexSelected(2),
                color: DeliveryColors.purple,
                textColor: Colors.white,
                child: const Icon(
                  Icons.account_circle,
                  size: 40,
                  color: DeliveryColors.white,
                ),
                padding: const EdgeInsets.all(8),
                shape: const CircleBorder(),
              ),
              ClipOval(
                child: Material(
                  shape: const CircleBorder(),
                  color: index == 3
                      ? DeliveryColors.lightGrey
                      : Theme.of(context).bottomAppBarColor,
                  child: IconButton(
                    onPressed: () => onIndexSelected(3),
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 34,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  shape: const CircleBorder(),
                  color: index == 4
                      ? DeliveryColors.lightGrey
                      : Theme.of(context).bottomAppBarColor,
                  child: IconButton(
                    onPressed: () => onIndexSelected(4),
                    icon: Icon(
                      Icons.settings,
                      size: 34,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
