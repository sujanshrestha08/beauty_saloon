import 'dart:core';

import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/models/servicemodel.dart';
import 'package:touchofbeauty_flutter/utils/Image.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> categoryList = <CategoryModel>[];
  categoryList.add(CategoryModel(img: All, categoryName: 'All'));
  categoryList.add(CategoryModel(img: SkinCare, categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: MakeUp, categoryName: 'Make Up'));
  categoryList.add(CategoryModel(img: HairColor, categoryName: 'Hair Color'));
  categoryList.add(CategoryModel(img: Nails, categoryName: 'Nails'));
  categoryList.add(CategoryModel(img: Waxing, categoryName: 'Waxing'));

  return categoryList;
}

// class Category {
//   String img;
//   String categoryName;
//   List servicedata;

//   Category(this.img, this.categoryName, this.servicedata);
// }

class CategoryService {
  String name;
  String image;
  List<String> servicedata;

  CategoryService(this.name, this.image, this.servicedata);
}

class CategoryServiceList {
  static List<CategoryService> allData = [
    CategoryService("All", All, ["A", "B", "C", "D"]),
    CategoryService("Skin Care", SkinCare, ["E", "F", "G", "H"]),
    CategoryService(
        "Makeup",
        "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5haWwlMjBwb2xpc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
        ["I", "J", "K", "L"]),
    CategoryService(
        "Hair Color",
        "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5haWwlMjBwb2xpc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
        ["M", "N", "O", "P"]),
    CategoryService(
        "Nails",
        "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5haWwlMjBwb2xpc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
        ["A", "B", "C", "D"]),
    CategoryService(
        "Waxing",
        "https://images.unsplash.com/photo-1599948128020-9a44505b0d1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG5haWwlMjBwb2xpc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
        ["A", "B", "C", "D"]),
  ];
}

class Service {
  String name;
  String image;
  int price;
  String duration;
  String description;

  Service(this.name, this.image, this.price, this.duration, this.description);
}

class ServiceList {
  static List<Service> allServiceData = [
    Service("Gel Polish", All, 1000, "30 mins", "nksjdnk"),
    Service("French Nail", All, 1500, "30 mins", "nksjrkjfjdnk"),

  ];
}
