import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touchofbeauty_flutter/models/categories_model.dart';
import 'package:touchofbeauty_flutter/screens/about.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/screens/contact.dart';
import 'package:touchofbeauty_flutter/screens/dashboard.dart';
import 'package:touchofbeauty_flutter/screens/faqs.dart';
import 'package:touchofbeauty_flutter/screens/homepage.dart';
import 'package:touchofbeauty_flutter/screens/login_screen.dart';
// import 'package:touchofbeauty_flutter/screens/homepage2.dart';
import 'package:touchofbeauty_flutter/screens/onboardingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touchofbeauty_flutter/screens/services.dart';
import 'package:touchofbeauty_flutter/services/cart_provider.dart';
import 'package:touchofbeauty_flutter/services/get_appointment_services.dart';
import 'package:touchofbeauty_flutter/services/get_categories_services.dart';
import 'package:touchofbeauty_flutter/services/get_services.dart';
import 'package:touchofbeauty_flutter/services/time_provider.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GetCategory()),
    ChangeNotifierProvider(create: (_) => GetServicesProvider()),
    ChangeNotifierProvider(create: (_) => GetAppointment()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => TimeProvider()),
  ], child: const MyApp()));
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
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboard' : 'onboard',

      routes: {
        'home': (context) => HomePage(),
        '/dashboard': (context) => DashboardScreen(),
        '/login': (context) => LoginScreen(),
        'onboard': (context) => OnBoardingPage(),
        '/about': (context) => AboutPage(),
        '/faqs': (context) => FAQS(),
        // '/services': (context) => Service(id:, name),
        // '/cart': (context) => MyCart(),
        '/appointment': (context) => AppointmentPage(),
        '/logout': (context) => LoginScreen(),
      },
    );
  }
}
