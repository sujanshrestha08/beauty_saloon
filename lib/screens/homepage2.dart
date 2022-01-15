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
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerSlide(),
        body:Column(children: [_searchPlusImage(), serviceWidget()],),
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

  Widget _searchPlusImage() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Flexible(
          child: Row(
            children: [
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.grey,
                    ));
              }),
              const SizedBox(width: 15),
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
              const SizedBox(width: 10),
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
      ],
    );
  }

  Widget serviceWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: categoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Image.asset(categoryList[index].img,
                          height: 40, width: 40),
                      // 8.height,
                      Text(categoryList[index].categoryName,
                          style: TextStyle(color: Colors.black, fontSize: 14))
                    ],
                  ),
                );
              },
            ),
          ),
          // 8.height,

          // Container(
          //   height: 220,
          //   child: ListView.builder(
          //     padding: EdgeInsets.all(8),
          //     itemCount: offerList.length,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //         width: 220,
          //         margin: EdgeInsets.all(8),
          //         child: Card(
          //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //           shadowColor: BHGreyColor.withOpacity(0.3),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisSize: MainAxisSize.max,
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //                 child: commonCacheImageWidget(offerList[index].img, 100, width: 250, fit: BoxFit.cover),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.all(8),
          //                 child: Text(
          //                   offerList[index].offerName,
          //                   style: TextStyle(fontSize: 14, color: BHAppTextColorPrimary, fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               Container(
          //                 padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   mainAxisSize: MainAxisSize.max,
          //                   children: [
          //                     Text(
          //                       offerList[index].offerDate,
          //                       style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14),
          //                       textAlign: TextAlign.left,
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.end,
          //                       children: [
          //                         Text(
          //                           '\$${offerList[index].offerOldPrice}',
          //                           style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14, decoration: TextDecoration.lineThrough),
          //                         ),
          //                         8.width,
          //                         Text(
          //                           '\$${offerList[index].offerNewPrice}',
          //                           style: TextStyle(color: BHColorPrimary, fontWeight: FontWeight.bold, fontSize: 16),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(right: 16, left: 16),
          //   child: Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: BHAppTextColorPrimary)),
          // ),
          // ListView.builder(
          //   itemCount: servicesList.length,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   padding: EdgeInsets.all(8),
          //   scrollDirection: Axis.vertical,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       margin: EdgeInsets.all(8),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: whiteColor,
          //         boxShadow: [BoxShadow(color: BHGreyColor.withOpacity(0.3), offset: Offset(0.0, 1.0), blurRadius: 2.0)],
          //       ),
          //       child: Row(
          //         children: [
          //           ClipRRect(
          //             borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          //             child:commonCacheImageWidget(servicesList[index].img, 80, width: 80, fit: BoxFit.cover),
          //           ),
          //           8.width,
          //           Column(
          //             children: [
          //               Align(
          //                 alignment: Alignment.centerLeft,
          //                 child: Text(
          //                   servicesList[index].serviceName,
          //                   style: TextStyle(fontWeight: FontWeight.bold, color: BHAppTextColorPrimary, fontSize: 14),
          //                 ),
          //               ),
          //               8.height,
          //               Row(
          //                 children: [
          //                   Text(
          //                     servicesList[index].time,
          //                     style: TextStyle(color: BHAppTextColorSecondary, fontSize: 14),
          //                   ),
          //                   8.width,
          //                   Text(
          //                     '\$${servicesList[index].price}',
          //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: BHColorPrimary),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ).expand(),
          //           Radio(
          //             value: servicesList[index].radioVal,
          //             groupValue: _radioValue1,
          //             activeColor: BHColorPrimary,
          //             onChanged: (value) => something(value),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
          //   child: RaisedButton(
          //     padding: EdgeInsets.all(12),
          //     onPressed: () {
          //       BHPackageOffersScreen().launch(context);
          //     },
          //     color: BHColorPrimary,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: Text(BHBtnBookAppointment, style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold)),
          //   ),
          // ),
        ],
      ),
    );
  }
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