import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/cart_model.dart';
import 'package:touchofbeauty_flutter/models/categories_model.dart';
import 'package:touchofbeauty_flutter/models/get_services_model.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
// import 'package:touchofbeauty_flutter/utils/shared_services.dart';
import 'package:http/http.dart' as http;

class GetServicesProvider extends ChangeNotifier {
  List<GetServices>? _check = <GetServices>[];
  List<GetServices>? get value => _check;
  Future<dynamic> getService(
    context,
    String id,
  ) async {
    // String? token = await SharedServices.loginDetails();
    var response = await http.get(
      Uri.parse(URL.services + id),
      // headers: {
      //   "Authorization": "Bearer $token",
      //   "Access-Control-Allow-Origin": "/",
      //   "Content-Type": "application/json",
      // },
    );
    if (response.statusCode == 200) {
      var model = getServicesFromJson(response.body);
      _check = model.cast<GetServices>();
      // var model = workRotaModelFromJson(response.body);
      //   _check = model.data;
      notifyListeners();
    } else {
      MotionToast.error(description: const Text('Error')).show(context);
    }
  }
}
