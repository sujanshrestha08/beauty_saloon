import 'dart:convert';

PostAppointment postAppointmentFromJson(String str) =>
    PostAppointment.fromJson(json.decode(str));

String postAppointmentToJson(PostAppointment data) =>
    json.encode(data.toJson());

class PostAppointment {
  PostAppointment({
    this.msg,
  });

  String? msg;

  factory PostAppointment.fromJson(Map<String, dynamic> json) =>
      PostAppointment(
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
      };
}
