import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/components/main_app_bar.dart';
import 'package:megabyte/components/navigation_drawer.dart';
import 'package:megabyte/components/profile_widget.dart';
import 'package:megabyte/models/user.dart';
import 'package:megabyte/models/user_preferences.dart';

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            buildUserProfile(user),
          ],
        ),
      ),
    );
  }

  Widget buildUserProfile(User user) {
    String city = user.city != null ? user.city! : "No information";
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        "Name: " + user.firstName + " " + user.lastName,
        style: const TextStyle(
            fontSize: 26.0, color: yellow, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        "Email: " + user.email,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        "Phone: " + user.phoneNo,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        "City: " + city,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        "Country: " + user.country,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ]);
  }
}
