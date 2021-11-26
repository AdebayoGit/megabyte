import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megabyte/components/auth_components.dart';
import 'package:megabyte/services/validator.dart';
import 'package:megabyte/views/sign_in.dart';

class Recover extends StatelessWidget {
  Recover({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        const Text(''),
                        AuthTextField(
                          controller: _email,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email eg. john@doe.com',
                          validator: Validator.emailValidator,
                          icon: Icons.mail_outlined,
                        ),
                        Button(
                          title: 'RECOVER',
                          press: (){
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context){
                                  return const ProgressDialog(status: 'Please Wait...',);
                                });
                          },
                          color: Colors.yellow,
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              createRoute(
                                SignIn(),
                              ), (Route<dynamic> route) => false,
                            );
                          },
                          login: false,
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
}
