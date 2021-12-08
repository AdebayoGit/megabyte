import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A271F),
        title: const Text('About Us - MegaMillions Naija'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.1)
              .copyWith(bottom: _size.height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              RichText(
                text: const TextSpan(
                  text: 'MEGA',
                  children: [
                    TextSpan(text: 'MILLIONS'),
                  ],
                ),
              ),
              Text(
                abt,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String abt =
      '''International Gaming & Entertainment Limited (IGE) has been licensed by the National Lottery Regulatory Commission to operate a national lottery promotional scheme, MegaMillions Naija. 

To ensure compliance with those regulatory requirements of our license we undertake an annual financial audit and an annual audit of our operational procedures, with both reports submitted to the National Lottery Regulatory Commission. This is in addition to an auditing of customer orders against tickets purchased and the resulting draw outcomes. The entire audit process enables players, agents and suppliers to have complete confidence that business is conducted in a professional manner.



Vision

To become the biggest lottery operator in Sub-Saharan Africa with exceptional services built on integrity, excellence and accountability.

 

Mission

Creating a secured world-class lottery platform with the best global technological standards for the empowering of players while also enjoying excellent entertainment services.

 

Core Values

1. Integrity:

We stay true to our claims and commitment without wavering

 

2. Security:

Our platform is secured with the best cyber protection facilities to ensure as much as practicable the protection of all transactions and details utilized and/ or requested for the use or enjoyment of the platform.

 

3. Accountability:

We are open and data-driven with top-notch reporting procedures to create the necessary checks required for optimal out-of-this-world services on a consistent basis.

 

4. Creativity:

Our Team consist of members who strive to initiate new robust ways for ensuring the best lottery experience for all Users and the seamlessness of the end to end activities on the platform.




5. Excellence:

The critical success factor for us is the ensured finesse and rigour factored into every system, process and procedure, the critique of details to emphasise nothing but the best from all of us so that you, our esteemed Users can have the best experience,''';
}
