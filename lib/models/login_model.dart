import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.msg,
    this.success,
  });

  String? token;
  String? msg;
  bool? success;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        msg: json["msg"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "msg": msg,
        "success": success,
      };
}
