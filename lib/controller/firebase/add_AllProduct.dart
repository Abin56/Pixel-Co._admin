// ignore_for_file: file_names
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';
import '../../views/drawer/pages/admin/pages/product_Mangement/screen_product_M.dart';

class AddProductDetailsToFireBase {
  Future addProductController(AddProductModel productModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc =  firebase.collection("AllProducts").doc();
      productModel.id = doc.id;

      doc.set(productModel.toJson()).then((value) async {
        Get.off(ScreenProductMangement(
          id: doc.id,
        ));
      });
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
