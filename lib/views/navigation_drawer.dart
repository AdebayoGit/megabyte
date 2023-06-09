import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megabyte/views/about_us.dart';
import 'package:megabyte/views/become_an_affliate.dart';
import 'package:megabyte/views/faq_page.dart';
import 'package:megabyte/views/home_page.dart';
import 'package:megabyte/views/personal_details_page.dart';
import 'package:megabyte/views/sign_in.dart';
import 'package:megabyte/views/vip_packages_page.dart';
import 'package:megabyte/views/wallet.dart';

import '../components/colors.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 10);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: lightGreen,
        child: ListView(
          // padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildDrawerMenuItem(
              pageTitle: 'Personal Details',
              icon: Icons.person,
              onClicked: () => _selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'Wallet/Transactions',
              icon: Icons.account_balance_wallet,
              onClicked: () => _selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'VIP Packages',
              icon: Icons.person,
              onClicked: () => _selectedItem(context, 3),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'Become An Affiliate',
              icon: Icons.people,
              onClicked: () => _selectedItem(context, 4),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'About us',
              icon: Icons.account_box,
              onClicked: () => _selectedItem(context, 5),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'FAQ',
              icon: Icons.help,
              onClicked: () => _selectedItem(context, 6),
            ),
            const SizedBox(height: 18),
            const Divider(
              thickness: 1,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'HOME',
              icon: Icons.home,
              onClicked: () => _selectedItem(context, 7),
            ),
            const SizedBox(height: 16),
            buildDrawerMenuItem(
              pageTitle: 'LOGOUT',
              icon: Icons.logout_rounded,
              onClicked: () => _selectedItem(context, 8),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerMenuItem({
    required String pageTitle,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    final hoverColor = Colors.yellow.shade500;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title:
          Text(pageTitle, style: const TextStyle(color: color, fontSize: 20)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void _selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PersonalDetailsPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdvancedSliverAppBar(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VIPPackagesPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Affiliates(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutUs(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const FAQPage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(
            title: 'Home',
          ),
        ));
        break;
      case 8:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignIn()));
        break;
    }
  }
}
