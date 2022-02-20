import 'dart:convert';

List<GetServices> getServicesFromJson(String str) => List<GetServices>.from(
    json.decode(str).map((x) => GetServices.fromJson(x)));

String getServicesToJson(List<GetServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetServices {
  GetServices({
    this.id,
    this.sname,
    this.sduration,
    this.sprice,
    this.sdescription,
    this.simage,
    this.cid,
    this.v,
  });

  String? id;
  String? sname;
  String? sduration;
  int? sprice;
  String? sdescription;
  String? simage;
  String? cid;
  int? v;

  factory GetServices.fromJson(Map<String, dynamic> json) => GetServices(
        id: json["_id"],
        sname: json["sname"],
        sduration: json["sduration"],
        sprice: json["sprice"],
        sdescription: json["sdescription"],
        simage: json["simage"],
        cid: json["cid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sname": sname,
        "sduration": sduration,
        "sprice": sprice,
        "sdescription": sdescription,
        "simage": simage,
        "cid": cid,
        "__v": v,
      };
}
