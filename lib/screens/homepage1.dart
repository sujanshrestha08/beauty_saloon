import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/widgets/drawer.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerSlide(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    // height: size.height * 0.2 - 27,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/appbarimage.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 26.0),
                      height: 54,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                            )
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.pink),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          // _scaffoldKey.currentState!.openDrawer();
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
