import 'dart:core';

import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> categoryList = <CategoryModel>[];
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'All'));
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'Make Up'));
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'Hair Color'));
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: Image(image: AssetImage('images/hairSalon/bh_hairColor.svg')), categoryName: 'Hair Color'));

  return categoryList;
}