import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
// import 'package:touchofbeauty_flutter/utils/dataProvider.dart';
import 'package:flutter/services.dart' as rootBundle;

class AllService extends StatefulWidget {
  const AllService({Key? key}) : super(key: key);

  @override
  _AllServiceState createState() => _AllServiceState();
}

class _AllServiceState extends State<AllService> {
  late List<AllServicesModel> allservicesList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(
                  child: Text('${data.error}'),
                );
              } else if (data.hasData) {
                var items = data.data as List<AllServicesModel>;
                return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          leading: Image(
                            height: 120,
                            width: 60,
                            image: NetworkImage(items[index].image.toString()),
                            fit: BoxFit.fill,
                          ),
                          title: Expanded(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 9, right: 8),
                                  child: Text(items[index].name.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9, right: 8),
                                  child: Text(items[index].duration.toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9, right: 8),
                                  child: Row(
                                    children: [
                                      Text('Rs.'),
                                      Text(items[index].price.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                          trailing: ElevatedButton(
                            child: Text('Add to cart'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                          ),
                        ),
                      );
                      // Card(
                      //   clipBehavior: Clip.hardEdge,
                      //   elevation: 10,
                      //   margin: EdgeInsets.all(8),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         width: 80,
                      //         height: 100,
                      //         child: Image(
                      //           image: NetworkImage(
                      //               items[index].image.toString()),
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //       Expanded(
                      //           child: Container(
                      //         padding: EdgeInsets.only(bottom: 8),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Padding(
                      //               padding:
                      //                   EdgeInsets.only(left: 9, right: 8),
                      //               child: Text(items[index].name.toString()),
                      //             ),
                      //             Padding(
                      //               padding:
                      //                   EdgeInsets.only(left: 9, right: 8),
                      //               child: Text(
                      //                   items[index].duration.toString()),
                      //             ),
                      //             Padding(
                      //               padding:
                      //                   EdgeInsets.only(left: 9, right: 8),
                      //               child: Row(
                      //                 children: [
                      //                   Text('Rs.'),
                      //                   Text(items[index].price.toString()),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       )),
                      //     ],
                      //   ),
                      // ),
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<List<AllServicesModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('json/service.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => AllServicesModel.fromJson(e)).toList();
  }
}
