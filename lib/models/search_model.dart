import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  Search({
    this.id,
    this.cname,
    this.cimage,
    this.v,
  });

  String? id;
  String? cname;
  String? cimage;
  int? v;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["_id"],
        cname: json["cname"],
        cimage: json["cimage"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cname": cname,
        "cimage": cimage,
        "__v": v,
      };
}
