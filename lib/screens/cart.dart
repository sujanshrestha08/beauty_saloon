import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:touchofbeauty_flutter/screens/allservice1.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/services/book_apiservices.dart';
import 'package:touchofbeauty_flutter/services/cart_provider.dart';
import 'package:date_format/date_format.dart';

class MyCart extends StatefulWidget {
  // final String id;
  // final String productId;
  // final String name;
  // final String image;
  // final String duration;
  // final String price;
  const MyCart({
    Key? key,
    // required this.id,
    // required this.productId,
    // required this.name,
    // required this.image,
    // required this.duration,
    // required this.price
  }) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

List<Services> serv = [];

class Services {
  final String? services;
  Services({this.services});
  Services.fromMap(Map<String, dynamic> res) : services = res['services'];
  Map<String, String?> toMap() {
    return {
      'services': services,
    };
  }
}

class _MyCartState extends State<MyCart> {
  String? _setTime, _setDate;
  String? _hour, _minute, _time;
  String? dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<dynamic> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute.toString();
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute), [
          hh,
          ':',
          nn,
        ]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute), [
      hh,
      ':',
      nn,
      " ",
    ]).toString();
    super.initState();
    Provider.of<CartProvider>(context, listen: false).lst;
    // print("${Provider.of<CartProvider>(context, listen: false).lst}");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      if (value.lst.isEmpty == true) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('My Cart'),
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
            ),
            body: const Center(
              child: Text("Empty Cart"),
            ));
      } else {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<CartProvider>(context, listen: false).lst.clear();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepOrange,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            onPressed: () async {
              // if ((Provider.of<CartProvider>(context, listen: false).lst)
              //         .isEmpty ==
              //     true) {
              //   return Container();
              // }
              for (int i = 0; i < value.lst.length; i++) {
                serv.add(Services(
                  services: value.lst[i].productId,
                ));
              }
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Card(
                            margin: const EdgeInsets.all(5),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Form(
                                // key: globalCompleteFormKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "Please Select date and time to book.",
                                      style: TextStyle(
                                        color: Colors.purple[800],
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Select Date",
                                            style: TextStyle(
                                              color: Colors.purple[800],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              _selectDate(context);
                                            },
                                            child: Card(
                                              elevation: 10,
                                              child: Container(
                                                width: 180,
                                                height: 40,
                                                // margin:
                                                //     const EdgeInsets.only(top: 30),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.purple[100]),
                                                child: TextFormField(
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center,
                                                  enabled: false,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: _dateController,
                                                  // onSaved: (String val) {
                                                  //   _setDate = val;
                                                  // },
                                                  decoration: const InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 0.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Select Time",
                                            style: TextStyle(
                                              color: Colors.purple[800],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _selectTime(context);
                                            },
                                            child: Card(
                                              elevation: 10,
                                              child: Container(
                                                // margin:
                                                //     const EdgeInsets.only(top: 30),
                                                width: 160,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.purple[100]),
                                                child: TextFormField(
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center,
                                                  enabled: false,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: _timeController,
                                                  decoration: const InputDecoration(
                                                      disabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      contentPadding:
                                                          EdgeInsets.all(5)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        for (int i = 0; i < serv.length; i++) {
                                          //   list add( value.lst[i].productId);
                                          // print("${value.lst[i].productId},");
                                          // print(services);
                                          // print(serv.length);
                                          serv.add(serv[i]);
                                          // print(serv[i]);
                                          // for (var data in value.lst) {
                                          // serv.add(data.productId);
                                          // }
                                          await postBook(
                                                  context,
                                                  _dateController.text,
                                                  _timeController.text,
                                                  serv)
                                              .then((value) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                fullscreenDialog: true,
                                                builder: (context) =>
                                                    const AppointmentPage(),
                                              ),
                                            );
                                            MotionToast.success(
                                                    description: const Text(
                                                        "Appointment Successful"))
                                                .show(context);
                                            Provider.of<CartProvider>(context)
                                                .lst
                                                .clear();
                                          });
                                        }
                                        // }
                                      },
                                      child: const Text(
                                        "Book Appointment",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange,
                                        // shape: const StadiumBorder(),
                                        // fixedSize:
                                        //     const Size(double.maxFinite, double.infinity),
                                        textStyle: const TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: const Text("Book"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.lst.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            color: Colors.red,
                          ),
                          onDismissed: (direction) {
                            value.del(
                              index,
                            );
                          },
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade100,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 160,
                                            child: Text(
                                              value.lst[index].name.toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.purple[600],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Text(
                                            "\$ Rs. ${value.lst[index].productPrice}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.purple[600]),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "Duration: ${value.lst[index].duration}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.purple[600]),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
