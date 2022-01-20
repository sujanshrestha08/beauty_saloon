import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
import 'package:touchofbeauty_flutter/utils/dataProvider.dart';

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
    allservicesList = getAllServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            itemCount: allservicesList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        allservicesList[index].img,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // 8.width,
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            allservicesList[index].serviceName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 14),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              allservicesList[index].time,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            Text(
                              '\$${allservicesList[index].price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.amber),
                            ),
                          ],
                        ),
                      ],
                    )
                    // Radio(
                    //   value: servicesList[index].radioVal,
                    //   groupValue: _radioValue1,
                    //   activeColor: BHColorPrimary,
                    //   onChanged: (value) => something(value),
                    // ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
