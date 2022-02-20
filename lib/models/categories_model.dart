import 'dart:convert';

List<GetCategories> getCategoriesFromJson(String str) =>
    List<GetCategories>.from(
        json.decode(str).map((x) => GetCategories.fromJson(x)));

String getCategoriesToJson(List<GetCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategories {
  GetCategories({
    this.id,
    this.cname,
    this.cimage,
    this.v,
  });

  String? id;
  String? cname;
  String? cimage;
  int? v;

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
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
