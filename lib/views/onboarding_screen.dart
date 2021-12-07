import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/views/sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignIn()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/affiliates.png',
      fit: BoxFit.cover,
      height: double.infinity,
      //width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.network('$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.black);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.black),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 8),
                child: _buildImage("https://megamillionsnaija.com/assets/images/logo.png?v=1.0", 70),
              ),
            ),
          ),
          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'Let\'s go right away!',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          pages: [
            PageViewModel(
              title: "Fractional shares",
              body:
              "Instead of having to buy an entire share, invest any amount you want.",
              image: _buildImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJoqnSNICPcXiuiGcATcUMRaFEA6zXBO07Eg&usqp=CAU'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Learn as you go",
              body:
              "Life can be difficult but doing what you love shouldn't. We'll be with you every step of the way.",
              image: _buildImage('https://github.com/Pyozer/introduction_screen/blob/master/example/assets/img2.jpg?raw=true'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Play from Anywhere",
              body:
              "Everybody can now follow and play there favourite games from wherever they are.",
              image: _buildImage('https://prd-wret.s3.us-west-2.amazonaws.com/assets/palladium/production/s3fs-public/styles/full_width/public/vhp_img5720.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Partner with us",
              image: _buildFullscreenImage(),
              bodyWidget: Container(
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
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
                    child: Image.asset('assets/images/affiliate_btn.png'),
                  ),
                ),
              ),
              decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 1),
                descriptionPadding: EdgeInsets.all(0.0),
                fullScreen: true,
                bodyFlex: 2,
                imageFlex: 3,
                titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
                bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.white),
              ),
            ),
            PageViewModel(
              title: "Secure Lottery Tickets Purchase",
              body: "All data in your lottery ticket transaction are digitally coded using SSL technology within a secured server environment ensuring your payment details are always safe and secure.",
              image: _buildImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMv1qpIC0UYJHYczZSWgrV7HgjOsfU1H4-ZSM4jdSgCVQHv4fAbJssFI32MJb--L3NOXg&usqp=CAU'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Like what you hear ???",
              body: "Don't wait too long join us and start stacking the bundles",
              decoration: pageDecoration.copyWith(
                bodyFlex: 2,
                imageFlex: 4,
                bodyAlignment: Alignment.bottomCenter,
                imageAlignment: Alignment.topCenter,
              ),
              image: _buildImage('https://www.naijaloaded.com.ng/wp-content/uploads/2017/11/Naira-Bundle.png'),
              reverse: true,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: Text('Skip', style: TextStyle(color: Colors.yellow)),
          next: const Icon(Icons.arrow_forward, color: Colors.yellow),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.yellow)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeColor: Colors.yellow,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: seaGreen,
            shape: RoundedRectangleBorder(),
          ),
        ),
      ),
    );
  }

  final String _url = 'https://megamillionsnaija.com/en/features#social-share';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}