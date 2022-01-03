import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/getx/getxcontroller/login_controller.dart/login_controller.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';
import 'package:getx_clean_architecture/app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const moreSize = 50.0;
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
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 46,
                    left: -moreSize / 2,
                    right: -moreSize / 2,
                    height: width + moreSize,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            DeliveryColors.green,
                            DeliveryColors.purple,
                          ],
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(250),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: 46,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 60,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Username',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle!
                                .color,
                          ),
                      textAlign: TextAlign.start,
                    ),
                    TextField(
                      controller: _loginController.usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: 'Username',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle!
                                .color,
                          ),
                      textAlign: TextAlign.start,
                    ),
                    TextField(
                      controller: _loginController.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.black,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: DeliveryColors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    Get.defaultDialog(content: const Text('Loading ...'));
    final loginResult = await _loginController.login();
    Get.back();
    if (loginResult) {
      Get.toNamed(DeliveryRoutes.home);
    } else {
      log('error login screen : Login failed');
    }
  }
}
