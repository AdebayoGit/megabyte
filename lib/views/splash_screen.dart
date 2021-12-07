import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:megabyte/components/auth_components.dart';
import 'package:megabyte/views/onboarding_screen.dart';
import 'package:megabyte/views/sign_in.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.of(context).push(
      createRoute(
        OnBoardingPage(),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A271F),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SpinKitFoldingCube(
                color: const Color(0xFFFFC61F),
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}