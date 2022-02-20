import 'package:touchofbeauty_flutter/http/httpuser.dart';

Future<dynamic> loginPost(String username, String password) {
  var res = HttpConnectUser().loginPosts(username, password);
  return res;
}
