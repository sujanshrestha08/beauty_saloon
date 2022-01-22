import 'dart:convert';

class AllServicesModel {
  int id;
  String name;
  String duration;
  int price;
  String description;
  String image;

  AllServicesModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.description,
    required this.image,
  });

  factory AllServicesModel.fromJson(Map<String, dynamic> json) =>
      AllServicesModel(
        id: json["id"],
        name: json["sname"],
        duration: json["sduration"],
        price: json["sprice"],
        description: json["sdescription"],
        image: json["simage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
