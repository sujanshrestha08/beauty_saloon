import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
import 'package:touchofbeauty_flutter/screens/allservice.dart';
import 'package:touchofbeauty_flutter/screens/allservice1.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/screens/profile.dart';
import 'package:touchofbeauty_flutter/utils/dataProvider.dart';
import 'package:touchofbeauty_flutter/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              const SizedBox(height: 10),

              Container(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/allcategory.jpg')),
                              Text('All')
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                      'assets/skincarecategory.jpg')),
                              Text('Skin Care')
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child:
                                      Image.asset('assets/makeupcategory.jpg')),
                              Text('Make Up')
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset(
                                      'assets/haircolorcategory.jpg')),
                              Text('Hair Color')
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child:
                                      Image.asset('assets/nailcategory.jpg')),
                              Text('Nails')
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllService()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child:
                                      Image.asset('assets/waxingcategory.jpg')),
                              Text('Waxing')
                            ],
                          ),
                        )),
                  ],
                ),
              )

              // Container(
              //   height: 150,
              //   child: ListView.builder(
              //     padding: const EdgeInsets.all(12),
              //     itemCount: CategoryServiceList.allData.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Services(
              //                     title: CategoryServiceList.allData[index].name,
              //                     datas: CategoryServiceList.allData[index].servicedata,
              //                   ),

              //                   ));
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.all(8),
              //           child: Column(
              //             children: <Widget>[
              //               Image.asset(CategoryServiceList.allData[index].image,
              //                   height: 60, width: 60),
              //               Text(CategoryServiceList.allData[index].name,
              //                   style: const TextStyle(
              //                       color: Colors.black, fontSize: 14)),
              //             ],
              //           ),
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
      ),
    );
  }
}
