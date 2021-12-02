import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/components/profile_widget.dart';
import 'package:megabyte/models/user.dart';
import 'package:megabyte/models/user_preferences.dart';
import 'package:megabyte/views/main_app_bar.dart';
import 'package:megabyte/views/navigation_drawer.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  bool _isEditingText = false;
  // late TextEditingController _editingController;
  final user = UserPreferences.myUser;
  String username =
      '${UserPreferences.myUser.firstName} ${UserPreferences.myUser.lastName}';
  String email = UserPreferences.myUser.email;
  String phone = UserPreferences.myUser.phoneNo;
  String country = UserPreferences.myUser.country;
  String? city = UserPreferences.myUser.city;

  // @override
  // void initState() {
  //   super.initState();
  //   _editingController = TextEditingController(text: initialText);
  // }

  // @override
  // void dispose() {
  //   _editingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: MainAppBar(
        context: context,
      ),
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Username",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                //color: lightGreen,
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: _editUserNameTextField(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Email",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                //color: lightGreen,
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: _editEmailTextField(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Phone Number",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                //color: lightGreen,
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: _editPhoneTextField(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "City",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  //color: lightGreen,
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: _editCityTextField()),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Country",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  //color: lightGreen,
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: _editCountryTextField()),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(yellow),
              ),
              onPressed: () {},
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ]);
  }

  Widget _editCountryTextField() {
    if (_isEditingText) {
      return TextField(
        onSubmitted: (newValue) {
          setState(() {
            country = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: TextEditingController(text: country),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        country,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _editCityTextField() {
    if (_isEditingText) {
      return TextField(
        onSubmitted: (newValue) {
          setState(() {
            city = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: TextEditingController(text: city),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        city ?? "",
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _editPhoneTextField() {
    if (_isEditingText) {
      return TextField(
        keyboardType: TextInputType.phone,
        onSubmitted: (newValue) {
          setState(() {
            phone = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: TextEditingController(text: phone),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        phone,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _editUserNameTextField() {
    if (_isEditingText) {
      return TextField(
        onSubmitted: (newValue) {
          setState(() {
            username = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: TextEditingController(text: username),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        username,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _editEmailTextField() {
    if (_isEditingText) {
      return TextField(
        onSubmitted: (newValue) {
          setState(() {
            email = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: TextEditingController(text: email),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        email,
        style: const TextStyle(
            fontSize: 22.0, color: yellow, fontWeight: FontWeight.bold),
      ),
    );
  }
}
