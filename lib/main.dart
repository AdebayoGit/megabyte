import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/services/color_util.dart';
import 'package:megabyte/views/home_page.dart';
import 'package:provider/provider.dart';

import 'components/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MegaMillionsApp());
}

class MegaMillionsApp extends StatelessWidget {
  const MegaMillionsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider<TicketNumbers>(
      create: (context) => TicketNumbers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mega Millions',
        theme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: generateMaterialColor(seaGreen),
            ).copyWith(
              secondary: generateMaterialColor(yellow),
            ),
            scaffoldBackgroundColor: generateMaterialColor(seaGreen)),
        home: const HomePage(title: 'Mega Millions'),
      ),
    );
  }
}
