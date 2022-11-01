import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/category_model.dart';
import 'package:pixels_admin/views/color/color.dart';
class AddCategoryToFireBase {
  final fireBase = FirebaseFirestore.instance;
  //
  addCategory(String categoryName) async {
    try {
      final CategoryModel data =
          //
          CategoryModel(
        categoryName: categoryName,
      );
      //
      await fireBase
          .collection('allCategory')
          .add(data.toJson())
          .then((value) async {
        log("Cat..................................${value.id}");
        value.id;
        await FirebaseFirestore.instance
            .collection("allCategory")
            .doc(value.id)
            .update({"id": value.id}).then((value) {
          Get.back();
          Get.snackbar('Message', 'New Category added',
              backgroundColor: Colors.green, colorText: kwhite);
        });
      });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
    
  }
  //

}
