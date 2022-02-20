import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:touchofbeauty_flutter/http/httpuser.dart';

class DrawerSlide extends StatefulWidget {
  const DrawerSlide({Key? key}) : super(key: key);

  @override
  State<DrawerSlide> createState() => _DrawerSlideState();
}

class _DrawerSlideState extends State<DrawerSlide> {
  // int _selected = 0;
  // void changeSelected(int index) {
  //   setState(() {
  //     _selected = index;
  //   });
  // }

  // Future<Map<String, dynamic>> viewProfile() {
  //   var res = HttpConnectUser().viewProfile(HttpConnectUser.token);
  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white38),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter + const Alignment(0, -.8),
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.yellowAccent,
                    backgroundImage:
                        AssetImage('assets/touchofbeautylogo1.jpg'),
                  ),
                ),
                Align(
                  alignment: Alignment.center + const Alignment(0, .5),
                  child: const Text(
                    "Touch Of Beauty",
                    style: TextStyle(
                        // fontFamily: "MoonDance",
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Get a premium service",
                  ),
                ),
              ],
            ),
          ),
          ListTile(
              // selected: _selected == 0,
              leading: const Icon(
                Icons.question_answer,
                color: Color(0xFFde8735),
                size: 26,
              ),
              title: const Text(
                'FAQs',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/faqs');
              }),
          ListTile(
              // selected: _selected == 1,
              leading: const Icon(
                Icons.feedback_rounded,
                color: Color(0xFFde8735),
                size: 26,
              ),
              title: const Text(
                'About Us',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              }),
          ListTile(
              // selected: _selected == 2,
              leading: const Icon(
                Icons.contact_phone,
                size: 26,
                color: Color(0xFFde8735),
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () async {
                // Map<String, dynamic> user = await viewProfile();

                // Navigator.pushNamed(context, '/profile', arguments: user);
              }),
          const Divider(
            thickness: 3,
            color: Color(0xFFde8735),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Text(
              "Find Us On:",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            // selected: _selected == 2,
            leading: const Icon(
              Icons.facebook,
              color: Color(0xFFde8735),
              size: 26,
            ),
            title: const Text(
              'Facebook',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // changeSelected(2);
            },
          ),
          ListTile(
            // selected: _selected == 3,
            leading: const Icon(
              Icons.web,
              color: Color(0xFFde8735),
              size: 26,
            ),
            title: const Text(
              'Website',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // changeSelected(3);
            },
          ),
        ],
      ),
    );
  }
}
