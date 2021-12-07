import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megabyte/components/auth_components.dart';
import 'package:megabyte/services/validator.dart';
import 'package:megabyte/views/home_page.dart';
import 'package:megabyte/views/recover_password.dart';
import 'package:megabyte/views/sign_up.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1A271F),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthTextField(
                          controller: _email,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email eg. john@doe.com',
                          validator: Validator.emailValidator,
                          icon: Icons.mail_outlined,
                        ),
                        PassTextField(
                          validator: Validator.passwordValidator,
                          controller: _password,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: _size.width * 0.8,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(right: 0.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                createRoute(
                                  Recover(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.yellow
                              ),
                            ),
                          ),
                        ),
                        Button(
                          title: 'SIGN IN',
                          press: () {
                            gotoScreen();
                          },
                          color: Colors.yellow,
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.of(context).push(
                              createRoute(
                                const SignUp(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  gotoScreen(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return const ProgressDialog(status: 'Please Wait...',);
        });
    return Timer(const Duration(seconds: 5), () => Navigator.of(context).push(
      createRoute(
        HomePage(title: 'Home'),
      ),
    ));

  }
}
