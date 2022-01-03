import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   Get.to(
    //     () => const LoginScreen(),
    //   );
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DeliveryColors.green,
              DeliveryColors.purple,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: Icon(
                Icons.account_circle_outlined,
                size: 60,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Delivery App',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w800, color: DeliveryColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
