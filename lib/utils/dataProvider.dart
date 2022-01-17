import 'dart:core';

import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/models/categorymodel.dart';
import 'package:touchofbeauty_flutter/utils/Image.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> categoryList = <CategoryModel>[];
  categoryList.add(CategoryModel(img: BHHairColor, categoryName: 'All'));
  categoryList.add(CategoryModel(img: BHMakeUp, categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: BHSkinCare, categoryName: 'Make Up'));
  categoryList.add(CategoryModel(img: BHMakeUp, categoryName: 'Hair Color'));
  categoryList.add(CategoryModel(img: BHSkinCare, categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: BHSkinCare, categoryName: 'Hair Color'));

  return categoryList;
}