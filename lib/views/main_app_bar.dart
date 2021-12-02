import 'package:flutter/material.dart';
import 'package:megabyte/views/wallet.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key, required BuildContext context})
      : super(
          key: key,
          elevation: 10.0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdvancedSliverAppBar(),
                ));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdvancedSliverAppBar(),
                  ));
                },
                icon: const Icon(Icons.account_balance_wallet)),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        );
}
