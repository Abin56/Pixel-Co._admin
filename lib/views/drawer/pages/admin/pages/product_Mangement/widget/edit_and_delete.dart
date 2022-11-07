// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable, await_only_futures

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/update_screen.dart';
import '../../../../../../color/color.dart';

class EditandDelete extends StatelessWidget {
  var id;
  EditandDelete({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(SizedBox(
            // color: kwhite,
            height: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250.w,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.green, Colors.green],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(
                      Radius.circular(22),
                    ),
                  ),
                  child: TextButton.icon(
                      onPressed: () async {
                        Get.off(UpdateScreen(
                          id: id,
                        ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: kwhite,
                      ),
                      label: const Text(
                        'Edit',
                        style: TextStyle(color: kwhite),
                      )),
                ),
                Container(
                  width: 250.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    gradient: const LinearGradient(
                        colors: [Colors.red, Colors.red],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(22),
                    ),
                  ),
                  child: TextButton.icon(
                      onPressed: () async {
                        log(id);
                        deleteProduct(id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: kwhite,
                      ),
                      label: const Text(
                        'Delete',
                        style: TextStyle(color: kwhite),
                      )),
                ),
              ],
            ),
          ));
          // Get.to();
        },
        icon: Icon(
          Icons.settings_suggest_outlined,
          color: kwhite.withOpacity(0.7),
        ));
  }
}

deleteProduct(id) async {
  final firebase =
      FirebaseFirestore.instance.collection("AllProducts").doc(id).delete();
  Fluttertoast.showToast(msg: "Deleting....");
}


