import 'dart:async';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
import 'package:touchofbeauty_flutter/screens/allservice.dart';
import 'package:touchofbeauty_flutter/screens/allservice1.dart';
import 'package:touchofbeauty_flutter/screens/appointment.dart';
import 'package:touchofbeauty_flutter/screens/cart.dart';
import 'package:touchofbeauty_flutter/screens/profile.dart';
import 'package:touchofbeauty_flutter/screens/services.dart';
import 'package:touchofbeauty_flutter/services/get_categories_services.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
import 'package:touchofbeauty_flutter/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CategoryModel> categoryList;
  late List<AllServicesModel> allserviceList;
  // color of the circle
  Color color = Colors.greenAccent;

  // event returned from accelerometer stream
  late AccelerometerEvent event;

  // hold a refernce to these, so that they can be disposed
  late Timer timer;
  late StreamSubscription accel;

  // positions and count
  double top = 125;
  late double left;
  int count = 0;

  // variables for screen size
  late double width;
  late double height;

  setColor(AccelerometerEvent event) {
    // Calculate Left
    double x = ((event.x * 12) + ((width - 100) / 2));
    // Calculate Top
    double y = event.y * 12 + 125;

    // find the difference from the target position
    var xDiff = x.abs() - ((width - 100) / 2);
    var yDiff = y.abs() - 125;

    // check if the circle is centered, currently allowing a buffer of 3 to make centering easier
    if (xDiff.abs() < 3 && yDiff.abs() < 3) {
      // set the color and increment count
      setState(() {
        color = Colors.greenAccent;
        count += 1;
        Navigator.of(context);
      });
    } else {
      // set the color and restart count
      setState(() {
        color = Colors.red;
        count = 0;
        Navigator.of(context);
      });
    }
  }

  setPosition(AccelerometerEvent event) {
    if (event == null) {
      return;
    }

    // When x = 0 it should be centered horizontally
    // The left positin should equal (width - 100) / 2
    // The greatest absolute value of x is 10, multipling it by 12 allows the left position to move a total of 120 in either direction.
    setState(() {
      left = ((event.x * 12) + ((width - 100) / 2));
    });

    // When y = 0 it should have a top position matching the target, which we set at 125
    setState(() {
      top = event.y * 12 + 125;
    });
  }

  startTimer() {
    // if the accelerometer subscription hasn't been created, go ahead and create it
    if (accel == null) {
      accel = accelerometerEvents.listen((AccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    } else {
      // it has already ben created so just resume it
      accel.resume();
    }

    // Accelerometer events come faster than we need them so a timer is used to only proccess them every 200 milliseconds
    if (timer == null || !timer.isActive) {
      timer = Timer.periodic(Duration(milliseconds: 200), (_) {
        // if count has increased greater than 3 call pause timer to handle success
        if (count > 3) {
          pauseTimer();
        } else {
          // proccess the current event
          setColor(event);
          setPosition(event);
        }
      });
    }
  }

  pauseTimer() {
    // stop the timer and pause the accelerometer stream
    timer.cancel();
    accel.pause();

    // set the success color and reset the count
    setState(() {
      count = 0;
      color = Colors.green;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    accel.cancel();
    super.dispose();
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
              ),
            );
          }),
          title: Row(
            children: [
              const SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 46,
                  width: 220,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search . . . ',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 46,
                  width: 20,
                  child: const TextField(
                    decoration: InputDecoration(icon: Icon(Icons.search)),
                  ),
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
              Consumer<GetCategory>(
                builder: (context, cate, _) {
                  if (cate.value?.isEmpty == true) {
                    cate.getCate(context);
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cate.value?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => Service(
                                      name:
                                          (cate.value?[index].cname).toString(),
                                      id: (cate.value?[index].id).toString(),
                                    ),
                                  ),
                                ),
                              },
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade100,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(URL.main +
                                              "/" +
                                              "${cate.value?[index].cimage}"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: SizedBox(
                                        height: 30,
                                        child: Text(
                                          (cate.value?[index].cname).toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.purple[600]),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
              // StreamBuilder<GyroscopeEvent>(
              //   stream: SensorsPlatform.instance.gyroscopeEvents,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       dx = dx + (snapshot.data!.y * 10);
              //       dy = dy + (snapshot.data!.x * 10);
              //       dz = dz + (snapshot.data!.z * 10);
              //     }
              //     if (dz >= 90.0) {
              //       MotionToast.success(
              //               description:
              //                   const Text('Successfully returned to Homepage'))
              //           .show(context);

              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             fullscreenDialog: true,
              //             builder: (context) => const HomePage()),
              //       );
              //     } else if (dz <= -90.0) {
              //       MotionToast.success(
              //               description: const Text(
              //                   'Successfully returned to Profile Page'))
              //           .show(context);

              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             fullscreenDialog: true,
              //             builder: (context) => Profile()),
              //       );
              //     } else {
              //       return Container();
              //     }
              //     return Text("$dx\n$dy\n$dz");
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  double dx = 100, dy = 100, dz = 100;
}
