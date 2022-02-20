import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/categories_model.dart';
import 'package:touchofbeauty_flutter/models/get_profile.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
// import 'package:touchofbeauty_flutter/utils/shared_services.dart';
import 'package:http/http.dart' as http;
import 'package:touchofbeauty_flutter/utils/shared_services.dart';

UpdateProfile model = UpdateProfile();
Future<dynamic> postProfile(
    context, username, email, password, phone, address) async {
  var body = {
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "address": address,
  };
  String? token = await SharedServices.loginDetails();
  var response = await http.put(
    Uri.parse(URL.client),
    headers: {
      "Authorization": "Bearer $token",
      "Access-Control-Allow-Origin": "/",
      "Content-Type": "application/json",
    },
    body: jsonEncode(body),
  );
  if (response.statusCode == 200) {
    model = updateProfileFromJson(response.body);
    return model;
  } else {
    MotionToast.error(description: const Text('Error')).show(context);
  }
}
