import 'package:flutter/material.dart';
import 'package:megabyte/components/auth_components.dart';
import 'package:megabyte/services/validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1A271F),
      //appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
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
                          controller: firstName,
                          textInputType: TextInputType.name,
                          hintText: 'First Name eg. John',
                          validator: Validator.nameValidator,
                          icon: Icons.person_outlined,
                        ),
                        AuthTextField(
                          controller: lastName,
                          textInputType: TextInputType.name,
                          hintText: 'Last Nmae eg. Doe',
                          validator: Validator.nameValidator,
                          icon: Icons.person_outlined,
                        ),
                        AuthTextField(
                          controller: email,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email eg. john@doe.com',
                          validator: Validator.emailValidator,
                          icon: Icons.mail_outlined,
                        ),
                        AuthTextField(
                          controller: phone,
                          textInputType: TextInputType.phone,
                          hintText: 'Phone eg. 08012345678',
                          validator: Validator.phoneValidator,
                          icon: Icons.phone_outlined,
                        ),
                        PassTextField(
                            validator: Validator.passwordValidator,
                            controller: password,
                        ),
                        const AuthCheckBox(),
                        Button(
                            title: 'REGISTER',
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
                            Navigator.of(context).pop();
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
