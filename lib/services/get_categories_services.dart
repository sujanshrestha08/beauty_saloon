import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/categories_model.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';
// import 'package:touchofbeauty_flutter/utils/shared_services.dart';
import 'package:http/http.dart' as http;

class GetCategory extends ChangeNotifier {
  List<GetCategories>? _check = [];
  List<GetCategories>? get value => _check;

  Future<dynamic> getCate(
    context,
  ) async {
    // String? token = await SharedServices.loginDetails();
    var response = await http.get(
      Uri.parse(URL.category),
      // headers: {
      //   "Authorization": "Bearer $token",
      //   "Access-Control-Allow-Origin": "/",
      //   "Content-Type": "application/json",
      // },
    );
    if (response.statusCode == 200) {
      var modelCat = getCategoriesFromJson(response.body);
      _check = modelCat;
      notifyListeners();
    } else {
      MotionToast.error(description: const Text('Error')).show(context);
    }
  }
}
