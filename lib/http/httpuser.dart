import 'dart:convert';

import 'package:http/http.dart';
import 'package:touchofbeauty_flutter/models/user.dart';
import 'package:touchofbeauty_flutter/response/user_resp.dart';

class HttpConnectUser {
  String baseurl = 'http://10.0.2.2:90/';
  String token = '';
  Future<bool> registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "email": user.email,
      "phone": user.phone,
      "password": user.password
    };

    final response =
        await post(Uri.parse(baseurl + 'client/register'), body: userMap);

    if (response.statusCode == 200) {
      var usrRes = ResponseUser.fromJson(jsonDecode(response.body));
      return usrRes.success!;
    } else {
      return false;
    }
  }

  Future<bool> loginPosts(String username, String password) async{
    Map<String, dynamic> loginClient = {
      'username': username,
      'password': password
    };

    try{
      final response= await post(Uri.parse(baseurl + 'client/login'),
      body: loginClient);

      final jsonData= jsonDecode(response.body) as Map;
      token= jsonData['token'];

      if(token.isNotEmpty){
         return true;
      }
    }catch(e){
      print(e);
    }
    return false;
  }
}