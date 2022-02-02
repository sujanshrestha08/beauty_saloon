import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
import 'package:touchofbeauty_flutter/screens/allservice.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/screens/profile.dart';
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
    MyCart(),
    AppointmentPage(),
    Profile(),
  ];

  late List<CategoryModel> categoryList;
  late List<AllServicesModel> allserviceList;

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
                width: 220,
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
                margin: EdgeInsets.only(bottom: 10),
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

              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Row(
                  children: const [
                    Text('Categories',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllService(),
                                settings: RouteSettings(
                                    arguments: categoryList[index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Image.asset(categoryList[index].img,
                                height: 60, width: 60),
                            Text(categoryList[index].categoryName,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   height: 150,
              //   child: ListView.builder(
              //     padding: const EdgeInsets.all(12),
              //     itemCount: CategoryService.allData.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         margin: const EdgeInsets.all(8),
              //         child: Column(
              //           children: <Widget>[
              //             Image(
              //                 height: 60,
              //                 width: 60,
              //                 image: AssetImage(
              //                     '${CategoryService.allData[index].img}')),
              //             // Text('${ CategoryService.allData[index].categoryName}',
              //             //     style: const TextStyle(
              //             //         color: Colors.black, fontSize: 14)),

              //             TextButton(
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>Services(
              //                             datas: CategoryService
              //                                 .allData[index].servicedata)));
              //               },
              //               child: Text(
              //                   '${CategoryService.allData[index].categoryName}',
              //                   style: const TextStyle(
              //                       color: Colors.black, fontSize: 14)),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
}
