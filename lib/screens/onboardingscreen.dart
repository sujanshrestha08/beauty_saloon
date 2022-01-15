import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:touchofbeauty_flutter/screens/homepage.dart';
import 'package:touchofbeauty_flutter/screens/homepage1.dart';
import 'package:touchofbeauty_flutter/screens/homepage2.dart';
import 'package:touchofbeauty_flutter/screens/login_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
          curve: Curves.easeIn,
          pages: [
            PageViewModel(
              title: "Touch of Beauty",
              body: "We care for your beauty",
              decoration: const PageDecoration(
                imageFlex: 2,
              ),
              image: const Image(
                fit: BoxFit.fitWidth,
                width: double.infinity,
                image: AssetImage("assets/haircurl.jpg"),
              ),
            ),
            PageViewModel(
              title: "Touch of Beauty",
              body: "We care for your beauty",
              decoration: const PageDecoration(imageFlex: 2),
              image: const Image(
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  image: AssetImage("assets/colorpallate.jpg")),
            )
          ],
          done: const Text('Done',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xffF5591F))),
          onDone: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(color: Color(0xffF5591F)),
          ),
          next: const Text('Next',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xffF5591F)))),
    );
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage2()),
      );

  PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      bodyTextStyle: const TextStyle(fontSize: 20),
      descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0));
}
