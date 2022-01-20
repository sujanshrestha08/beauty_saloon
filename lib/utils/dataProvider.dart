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

// class CategoryService {
//   static List<Category> allData = [
//     Category(All, "All", [
//       AllServicesModel(
//           img: All,
//           serviceName: 'Keratin Straight',
//           time: '3 hrs',
//           price: 5000,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Change Hair Color',
//           time: '1 hr',
//           price: 1000,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Straightening',
//           time: '3 hrs',
//           price: 3500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Cutting',
//           time: '20 mins',
//           price: 400,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//     ]),
//     Category(SkinCare, "Skin Care", [
//       AllServicesModel(
//           img: All,
//           serviceName: 'Keratin Straight',
//           time: '3 hrs',
//           price: 5000,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Change Hair Color',
//           time: '1 hr',
//           price: 1000,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Straightening',
//           time: '3 hrs',
//           price: 3500,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Cutting',
//           time: '20 mins',
//           price: 400,
//           addcart: 'Add to cart'),
//       AllServicesModel(
//           img: All,
//           serviceName: 'Hair Style',
//           time: '45 Min',
//           price: 500,
//           addcart: 'Add to cart'),
//     ])
//   ];
// }

// class Category with ChangeNotifier {
//   List<CategoryModel> categories = [
//     CategoryModel(img: All, categoryName: "All"),
//     CategoryModel(img: SkinCare, categoryName: 'Skin Care')
//   ];
// }

// List<CategoryModel> get categories {

//     return [...categories];

//   }

List<AllServicesModel> getAllServicesList() {
  List<AllServicesModel> allservicesList = <AllServicesModel>[];
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Keratin Straight',
      time: '3 hrs',
      price: 5000,
      addcart: 'Add to cart'));
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Hair Style',
      time: '45 Min',
      price: 500,
      addcart: 'Add to cart'));
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Change Hair Color',
      time: '1 hr',
      price: 1000,
      addcart: 'Add to cart'));
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Hair Cutting',
      time: '20 mins',
      price: 400,
      addcart: 'Add to cart'));
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Keratin Straight',
      time: '3 hrs',
      price: 5000,
      addcart: 'Add to cart'));
  allservicesList.add(AllServicesModel(
      img: All,
      serviceName: 'Hair Straightening',
      time: '3 hrs',
      price: 3500,
      addcart: 'Add to cart'));
  return allservicesList;
}

List<SkinServicesModel> getSkinServicesList() {
  List<SkinServicesModel> skinservicesList = <SkinServicesModel>[];
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Fruit Facial',
      time: '45 Min',
      price: 1300,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Basic Cleansing',
      time: '30 mins',
      price: 900,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Glowdermie',
      time: '55 mins',
      price: 1600,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus 4 Layers',
      time: '1 hr',
      price: 2200,
      addcart: 'Add to cart'));
  return skinservicesList;
}

List<SkinServicesModel> getHairServicesList() {
  List<SkinServicesModel> skinservicesList = <SkinServicesModel>[];
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Fruit Facial',
      time: '45 Min',
      price: 1300,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Basic Cleansing',
      time: '30 mins',
      price: 900,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus Glowdermie',
      time: '55 mins',
      price: 1600,
      addcart: 'Add to cart'));
  skinservicesList.add(SkinServicesModel(
      img: All,
      serviceName: 'Lotus 4 Layers',
      time: '1 hr',
      price: 2200,
      addcart: 'Add to cart'));
  return skinservicesList;
}
