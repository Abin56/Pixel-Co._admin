import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';

import '../../views/color/color.dart';
import '../../views/drawer/pages/admin/pages/product_Mangement/screen_product_M.dart';

class AddProductDetailsToFireBase {
  Future addProductController(AddProductModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      await firebase
          .collection("ProductList")
          .add(productModel.toJson())
          .then((value) async {
        print('Geting idddddddddddddddddddddddddddd${value.id.toString()}');

        value.id;
        await FirebaseFirestore.instance
            .collection('ProductList')
            .doc(value.id)
            .update({"id": value.id}).then((value) {
          Get.offAll(ScreenProductMangement(id: ''));
        }).then((value) => Get.snackbar('Message', 'New Product added',
                backgroundColor: Colors.green, colorText: kwhite));
      });
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
