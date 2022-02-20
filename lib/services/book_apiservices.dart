import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/book_appointment_model.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:touchofbeauty_flutter/utils/shared_services.dart';

Future<dynamic> postBook(
  context,
  String date,
  String time,
  List services,
) async {
  List service = [];
  for (var data in services) service.add(data.services);
  var body = {
    "adate": date,
    "atime": time,
    "service": service,
  };
  // for (int i = 0; i < services.length; i++) {
  //   body.addAll({"service[$i]": services[i]});
  // }
  String? token = await SharedServices.loginDetails();
  var response = await http.post(
    Uri.parse(URL.book),
    body: jsonEncode(body),
    headers: {
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/",
      "Content-Type": "application/json",
    },
  );
  if (response.statusCode == 200) {
    var modelCat = postAppointmentFromJson(response.body);
    return modelCat;
  } else {
    MotionToast.error(
            description: const Text("Couldn't make your appointment."))
        .show(context);
  }
}
