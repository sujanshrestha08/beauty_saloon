import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/http/httpuser.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/screens/homepage.dart';
import 'package:touchofbeauty_flutter/screens/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedindex = 0;
  var userData;
  void listenData() async {
    userData = await HttpConnectUser().viewProfile(HttpConnectUser.token);
    // print("Userdata");
    // print(userData);
  }

  @override
  Widget build(BuildContext context) {
    listenData();
    var _pages = [
      HomePage(),
      MyCart(),
      AppointmentPage(),
      Profile(udata: userData)
    ];
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFde8735),
          currentIndex: _selectedindex,
          onTap: (index) => setState(() => _selectedindex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
