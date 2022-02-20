import 'dart:convert';

List<AppointmentGet> appointmentGetFromJson(String str) =>
    List<AppointmentGet>.from(
        json.decode(str).map((x) => AppointmentGet.fromJson(x)));

String appointmentGetToJson(List<AppointmentGet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentGet {
  AppointmentGet({
    this.id,
    this.adate,
    this.atime,
    this.service,
    this.cid,
    this.v,
  });

  String? id;
  DateTime? adate;
  String? atime;
  List<Service>? service;
  Cid? cid;
  int? v;

  factory AppointmentGet.fromJson(Map<String, dynamic> json) => AppointmentGet(
        id: json["_id"],
        adate: DateTime.parse(json["adate"]),
        atime: json["atime"],
        service:
            List<Service>.from(json["service"].map((x) => Service.fromJson(x))),
        cid: Cid.fromJson(json["cid"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "adate": adate?.toIso8601String(),
        "atime": atime,
        "service": List<dynamic>.from(service!.map((x) => x.toJson())),
        "cid": cid?.toJson(),
        "__v": v,
      };
}

class Cid {
  Cid({
    this.id,
    this.username,
  });

  String? id;
  String? username;

  factory Cid.fromJson(Map<String, dynamic> json) => Cid(
        id: json["_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
      };
}

class Service {
  Service({
    this.id,
    this.sname,
    this.sprice,
  });

  String? id;
  String? sname;
  int? sprice;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        sname: json["sname"],
        sprice: json["sprice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sname": sname,
        "sprice": sprice,
      };
}
