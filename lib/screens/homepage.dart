// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currrentIndex = 0;
  final List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    //it will provide the total height and width of our screen
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36)),
              child: Stack(overflow: Overflow.visible, children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/appbarimage.jpg'),
                          fit: BoxFit.fill),
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
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.pink),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
      ),
      drawer: const DrawerSlide(),
      //body: _children[currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.primaries[0],
          unselectedItemColor: Colors.indigo.shade300,
          currentIndex: currrentIndex,
          onTap: (index) => setState(() => currrentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
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




// SafeArea(
//         child: Column(
//           children: [
//             Container(
//               child: Stack(
//                 children: [
//                   Positioned(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 20.0),
//                       height: 54,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         // borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             hintText: 'Search',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30))),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),