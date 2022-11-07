// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';
import 'package:pixels_admin/views/drawer/pages/admin/screen_admin.dart';
import '../../views/color/color.dart';
import '../../views/drawer/pages/admin/pages/product_Mangement/screen_product_M.dart';

class AddProductDetailsToFireBase {
  Future addProductController(AddProductModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = await firebase.collection("AllProducts").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) async {
        Get.off(ScreenProductMangement(
          id: doc.id,
        ));
      });
      //     .then(
      //   (value) async {
      //     // ignore: avoid_print
      //     print('Geting idddddddddddddddddddddddddddd${value.id.toString()}');

      //     value.id;
      //     // await FirebaseFirestore.instance
      //     //     .collection('ProductList')
      //     //     .doc(value.id)
      //     //     .update({"id": value.id}).then((value) {
      //     //   Get.offAll(ScreenProductMangement(id: ''));
      //     // }).then((value) => Get.snackbar('Message', 'New Product added',
      //     //         backgroundColor: Colors.green, colorText: kwhite));
      //   },
      // );
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
