import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navigation_drawer.dart';

class Affiliates extends StatefulWidget {
  const Affiliates({Key? key}) : super(key: key);

  @override
  _AffiliatesState createState() => _AffiliatesState();
}

class _AffiliatesState extends State<Affiliates> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A271F),
        title: const Text('BECOME AN AFFILIATE'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Image.asset('assets/images/affiliates.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: _size.height * 0.05),
              child: Text(
                partnership,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: _size.height * 0.05),
              child: Text(
                dream,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: _size.width * 0.7,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: _size.width * 0.7,
                //height: 100,
                decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, elevation: 0),
                  child: Image.asset('assets/images/affiliate_btn.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String partnership =
      'OUR PARTNERSHIP PROGRAM GIVES YOU THE OPPORTUNITY TO MAKE MORE MONEY BY SIGNING UP TO BECOME A MEGA MILLIONS NAIJA PARTNER RIGHT FROM THE COMFORT OF YOUR HOME.';
  String dream =
      'DON’T MAKE YOUR DREAMS WAIT ANY LONGER, JOIN MEGAMILLIONS NAIJA';

  final String _url = 'https://megamillionsnaija.com/en/features#social-share';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
