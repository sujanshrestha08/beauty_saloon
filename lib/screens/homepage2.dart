import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/utils/dataProvider.dart';
import 'package:touchofbeauty_flutter/widgets/drawer.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int currrentIndex = 0;
  final screens = [
    HomePage2(),
  ];

  int _selectedIndex = 0;

  late List<CategoryModel> categoryList;

  @override
  void initState() {
    super.initState();
    categoryList = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerSlide(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                ));
          }),
          title: Row(
            children: [
              const SizedBox(width: 5),
              Container(
                height: 46,
                width: 260,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 46,
                width: 20,
                child: const TextField(
                  decoration: InputDecoration(icon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/appbarimage.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),

              // category container starts

              Row(
                children: [Text(' Categories')],
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Image.asset(categoryList[index].img,
                              height: 60, width: 60),
                          // 8.height,
                          Text(categoryList[index].categoryName,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Container(
        //   height: 100,
        //   child: ListView.builder(
        //     padding: EdgeInsets.all(8),
        //     itemCount: categoryList.length,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Container(
        //         margin: EdgeInsets.all(8),
        //         child: Column(
        //           children: <Widget>[
        //             Image.asset(categoryList[index].img,
        //                 height: 40, width: 40),
        //             // 8.height,
        //             Text(categoryList[index].categoryName,
        //                 style:
        //                     TextStyle(color: Colors.black, fontSize: 14))
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),

        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFFde8735),
            // unselectedItemColor: Color(0xFFde8735),
            currentIndex: currrentIndex,
            onTap: (index) => setState(() => currrentIndex = index),
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
      ),
    );
  }

  // Widget _searchPlusImage() {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [
  //       Flexible(
  //         child: Row(
  //           children: [
  //             Builder(builder: (context) {
  //               return IconButton(
  //                   onPressed: () {
  //                     Scaffold.of(context).openDrawer();
  //                   },
  //                   icon: const Icon(
  //                     Icons.menu,
  //                     color: Colors.grey,
  //                   ));
  //             }),
  //             const SizedBox(width: 15),
  //             Container(
  //               height: 46,
  //               width: 260,
  //               decoration: const BoxDecoration(
  //                 color: Colors.white70,
  //               ),
  //               child: const TextField(
  //                 decoration: InputDecoration(
  //                   border: InputBorder.none,
  //                   hintText: 'Search...',
  //                   hintStyle: TextStyle(color: Colors.black54),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 10),
  //             Container(
  //               height: 46,
  //               width: 20,
  //               child: const TextField(
  //                 decoration: InputDecoration(icon: Icon(Icons.search)),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         height: size.height * 0.25,
  //         decoration: const BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage('assets/appbarimage.jpg'),
  //               fit: BoxFit.fill,
  //             ),
  //             borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(10),
  //                 bottomRight: Radius.circular(10))),
  //       ),
  //     ],
  //   );
  // }

  // Widget serviceWidget() {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           height: 100,
  //           child: ListView.builder(
  //             padding: EdgeInsets.all(8),
  //             itemCount: categoryList.length,
  //             scrollDirection: Axis.horizontal,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Container(
  //                 margin: EdgeInsets.all(8),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Image.asset(categoryList[index].img,
  //                         height: 40, width: 40),
  //                     // 8.height,
  //                     Text(categoryList[index].categoryName,
  //                         style: TextStyle(color: Colors.black, fontSize: 14))
  //                   ],
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}


// return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(200),
//         child: AppBar(
//           flexibleSpace: ClipRRect(
//             borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(30),
//                 bottomLeft: Radius.circular(30)),
//             child: Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/appbarimage.jpg'),
//                     fit: BoxFit.fill),
//               ),
//             ),
//           ),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30))),
//           iconTheme: IconThemeData(color: Colors.white),
//           leading: Builder(builder: (context) {
//             return IconButton(
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 icon: const Icon(Icons.menu));
//           }),
//         ),
//       ),
//       drawer: const DrawerSlide(),
//       body: SafeArea(
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
//     );