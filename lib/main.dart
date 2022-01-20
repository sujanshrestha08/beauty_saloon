import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/screens/about.dart';
import 'package:touchofbeauty_flutter/screens/faqs.dart';
import 'package:touchofbeauty_flutter/screens/homepage2.dart';
import 'package:touchofbeauty_flutter/screens/onboardingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OnBoardingPage(),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',

      routes: {
        'home': (context) => HomePage2(),
        'onboard': (context) => OnBoardingPage(),
        '/about': (context) => AboutPage(),
        '/faqs': (context) => FAQS(),
      },
    );
  }
}
