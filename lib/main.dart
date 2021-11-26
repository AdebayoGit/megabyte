import 'package:flutter/material.dart';
import 'package:megabyte/models/numbers.dart';
import 'package:megabyte/views/about_us.dart';
import 'package:megabyte/views/become_an_affliate.dart';
import 'package:megabyte/views/check_out.dart';
import 'package:megabyte/views/recover_password.dart';
import 'package:megabyte/views/sign_in.dart';
import 'package:megabyte/views/sign_up.dart';
import 'package:megabyte/views/wallet.dart';
import 'package:provider/provider.dart';

import 'components/ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TicketNumbers>(
      create: (context) => TicketNumbers(),
      child: MaterialApp(
        title: 'Mega Millions',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: const Color(0xFF1A271F),
        ),
        home: AdvancedSliverAppBar(),
      ),
    );
  }
}


