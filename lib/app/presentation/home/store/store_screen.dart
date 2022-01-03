import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/app/presentation/theme/theme.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            //List.generate(10, (index) => Container()),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).bottomAppBarColor,
              title: const Icon(
                Icons.store,
                size: 60,
              ),
              subtitle: Text(
                'Spicy Village',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
              ),
              onTap: () {},
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
              title: const Icon(
                Icons.store,
                size: 60,
              ),
              subtitle: Text(
                'Hotel Shakti Continental',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
