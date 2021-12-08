import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/color_util.dart';
import 'package:megabyte/views/home_page.dart';
import 'package:megabyte/views/onboarding_screen.dart';
import 'package:megabyte/views/splash_screen.dart';
import 'package:provider/provider.dart';

import 'components/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MegaMillionsApp());
}

class MegaMillionsApp extends StatelessWidget {
  const MegaMillionsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TicketNumbers>(
      create: (context) => TicketNumbers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mega Millions Naija',
        theme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: generateMaterialColor(seaGreen),
            ).copyWith(
              secondary: generateMaterialColor(yellow),
            ),
            scaffoldBackgroundColor: generateMaterialColor(seaGreen)),
        home: SplashScreen(),
      ),
    );
  }
}

//Todo fix navigation

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where resources needed in app are initialized while
    // the splash screen is displayed.
    await Future.delayed(const Duration(seconds: 5));
  }
}
