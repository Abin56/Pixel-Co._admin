// ignore_for_file: file_names

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/offerManagement_Model.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/offer_Management/screen_offer.dart';

class AddOfferProductToFireBase {
  Future addOfferController(OfferManagementModel offerModel) async {
    try {
      final firebase = FirebaseFirestore.instance;
      final doc = firebase.collection("OfferProduts").doc();
      offerModel.id = doc.id;

      doc.set(offerModel.toJson()).then((value) async {
        Get.off(ScreenOfferManagement(
          id: doc.id,
        ));
      }).then((value) => Get.snackbar("Message", 'New Offer Product added',
          backgroundColor: Colors.green, colorText: Colors.white));
    } on FirebaseException catch (e) {
      log('Error ${e.message.toString()}');
    }
  }
}
