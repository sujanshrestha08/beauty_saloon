import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerSlide extends StatefulWidget {
  const DrawerSlide({Key? key}) : super(key: key);

  @override
  State<DrawerSlide> createState() => _DrawerSlideState();
}

class _DrawerSlideState extends State<DrawerSlide> {
  int _selected = 0;
  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

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
                        fontFamily: "MoonDance",
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
              selected: _selected == 0,
              leading: const Icon(
                Icons.question_answer,
                size: 30,
              ),
              title: const Text(
                'FAQs',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
          ListTile(
              selected: _selected == 1,
              leading: const Icon(
                Icons.feedback_rounded,
                size: 30,
              ),
              title: const Text(
                'About Us',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
          ListTile(
              selected: _selected == 2,
              leading: const Icon(
                Icons.contact_phone,
                size: 30,
              ),
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {}),
          const Divider(
            thickness: 3,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Text(
              "Find Us On:",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            selected: _selected == 2,
            leading: const Icon(
              Icons.facebook,
              size: 30,
            ),
            title: const Text(
              'Facebook',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              changeSelected(2);
            },
          ),
          ListTile(
            selected: _selected == 3,
            leading: const Icon(
              Icons.web,
              size: 30,
            ),
            title: const Text(
              'Website',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              changeSelected(3);
            },
          ),
        ],
      ),
    );
  }
}
