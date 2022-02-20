import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/models/search_model.dart';
import 'package:http/http.dart' as http;
import 'package:touchofbeauty_flutter/utils/config.dart';

class GetSearch extends ChangeNotifier {
  List<Search>? _check = <Search>[];
  List<Search>? get value => _check;
  Future<dynamic> getService(
    context,
    String id,
  ) async {
    var response = await http.get(
      Uri.parse(URL.search + id),
    );
    if (response.statusCode == 200) {
      var model = searchFromJson(response.body);
      _check = model;
      notifyListeners();
    } else {
      MotionToast.error(description: const Text('Error')).show(context);
    }
  }
}
