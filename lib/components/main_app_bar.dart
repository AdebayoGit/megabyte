import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key})
      : super(
          key: key,
          elevation: 10.0,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_balance_wallet)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        );
}
