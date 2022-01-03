import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxbindings/home_bindings.dart';
import 'package:getx_clean_architecture/app/getx/getxbindings/login_bindings.dart';
import 'package:getx_clean_architecture/app/getx/getxbindings/product_and_kart_bindings.dart';
import 'package:getx_clean_architecture/app/getx/getxbindings/splash_bindings.dart';
import 'package:getx_clean_architecture/app/presentation/home/home_screen.dart';
import 'package:getx_clean_architecture/app/presentation/login/login_screen.dart';
import 'package:getx_clean_architecture/app/presentation/splash/splash_screen.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: DeliveryRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: DeliveryRoutes.home,
      page: () => const HomeScreen(),
      bindings: [
        HomeBindings(),
        ProductBindings(),
      ],
    ),
  ];
}
