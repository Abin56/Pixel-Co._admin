import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/category_model.dart';
import 'package:pixels_admin/views/color/color.dart';

class AddCategoryToFireBase {
  //
  final fireBase = FirebaseFirestore.instance;
  //
  addCategory(String categoryName) async {
    final CategoryModel data =
        //
        CategoryModel(categoryName: categoryName,);
    //
    await fireBase.collection('allCategory').add(data.toJson());
    Get.snackbar('Message', 'New Category added',
        backgroundColor: Colors.green, colorText: kwhite);
    Get.back();
  }
}
