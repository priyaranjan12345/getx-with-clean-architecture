import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/home_controller/home_controller.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';

class SettingsScreen extends GetView<HomeController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Obx(
              () => SwitchListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: Theme.of(context).bottomAppBarColor,
                title: Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                ),
                value: controller.isDarkTheme.value,
                onChanged: (value) {
                  controller.updateTheme(value);
                  
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Divider(
                thickness: 1.4,
                color: DeliveryColors.green,
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).bottomAppBarColor,
              title: Text(
                'SignOut',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
              ),
              onTap: () async {
                await controller.logout();
                Get.offAllNamed(DeliveryRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
