import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/appointment_get_model.dart';
import 'package:touchofbeauty_flutter/models/categories_model.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
// import 'package:touchofbeauty_flutter/utils/shared_services.dart';
import 'package:http/http.dart' as http;
import 'package:touchofbeauty_flutter/utils/shared_services.dart';

class GetAppointment extends ChangeNotifier {
  List<AppointmentGet>? _check = [];
  List<AppointmentGet>? get value => _check;

  Future<dynamic> getAppoint(
    context,
  ) async {
    String? token = await SharedServices.loginDetails();
    var response = await http.get(
      Uri.parse(URL.appointment),
      headers: {
        "Authorization": "Bearer $token",
        "Access-Control-Allow-Origin": "/",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var modelAppoint = appointmentGetFromJson(response.body);
      _check = modelAppoint;
      notifyListeners();
    } else {
      MotionToast.error(description: const Text('Error')).show(context);
    }
  }
}
