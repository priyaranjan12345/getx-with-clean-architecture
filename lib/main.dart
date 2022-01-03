import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxbindings/main_binding.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';
import 'package:getx_clean_architecture/app/routes/app_pages.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
