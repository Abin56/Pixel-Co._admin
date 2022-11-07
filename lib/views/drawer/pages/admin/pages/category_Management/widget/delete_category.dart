import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/views/home/screen_home.dart';

Future<dynamic> deleteCategory({required context, required id}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: const Text(
          "Are You Sure to delete the Category ?",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () async {
                log(id);
                homeController.delteCategoryformFireBase(id).then((value) {
                  Get.back();
                  Get.snackbar("Deleted", '');
                });
              },
              child: const Text("Ok")),
        ],
      );
    },
  );
}
