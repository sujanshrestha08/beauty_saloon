import 'package:flutter/material.dart';


class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Appointment'),
            centerTitle: true,
            backgroundColor: Colors.deepOrange),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('Confirm Booking'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange, onPrimary: Colors.deepOrange))
            ],
          ),
        ));
  }
}
