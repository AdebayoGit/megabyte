import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.yellow),
        ),
      ),
      child: child,
    );
  }
}

class AuthCheckBox extends StatefulWidget {
  const AuthCheckBox({Key? key}) : super(key: key);

  @override
  _AuthCheckBoxState createState() => _AuthCheckBoxState();
}

class _AuthCheckBoxState extends State<AuthCheckBox> {
  bool _accept = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _accept,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _accept = value!;
                });
              },
            ),
          ),
          const Expanded(
            child: Text(
              'By SIGNING UP, you agree to our Terms & Conditions and affirm that you are at least 18 years of age.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PassTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const PassTextField({
    Key? key,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.yellow,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.lock_outlined,
                color: Colors.yellow,
              ),
              hintText: "Password",
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(_obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                color: Colors.yellow,
                onPressed: _toggle,
              ),
              border: InputBorder.none,
            )));
  }
}

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final String? Function(String?)? validator;
  final IconData icon;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    required this.validator,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
            controller: controller,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.yellow,
            keyboardType: textInputType,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: Colors.yellow,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
            )));
  }
}

class Button extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final Color color, textColor;
  const Button({
    Key? key,
    required this.title,
    required this.press,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellow,
        ),
        //borderRadius: BorderRadius.circular(29),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        ),
        onPressed: press,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.yellow,
              letterSpacing: 5,
              wordSpacing: 3,
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? "Don’t have an Account ? " : "Already have an Account ? ",
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 15,
            ),
          ),
          TextButton(
            onPressed: press,
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressDialog extends StatelessWidget {

  final String status;
  const ProgressDialog({required this.status, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFF1A271F),
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: Colors.yellow, width: 2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 5,),

              const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),),
              const SizedBox(width: 25.0,),
              Text(status, style: const TextStyle(fontSize: 15, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}



Route createRoute(page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
