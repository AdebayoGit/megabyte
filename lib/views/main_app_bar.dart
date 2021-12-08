import 'package:flutter/material.dart';
import 'package:megabyte/views/wallet.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key, required BuildContext context})
      : super(
          key: key,
          elevation: 10.0,
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                ),
                const Text(
                  '₦80,765,000',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(
              width: 25.0,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdvancedSliverAppBar(),
                    ));
                  },
                  icon: const Icon(Icons.account_balance_wallet),
                ),
                const Text(
                  '₦435,900,000',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
        );
}
