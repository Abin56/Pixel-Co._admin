import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/screen_admin.dart';
import 'package:pixels_admin/views/home/screen_home.dart';

List<ScreenHiddenDrawer> pages = [];

class Controllers extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> categoryCollections = [];
  @override
  void onInit() {
    drawerMenulist();
    fetchingCategory();

    super.onInit();
  }

  Stream<List<AddProductModel>> getProductStream() {
    final data =
        FirebaseFirestore.instance.collection("AllProducts").snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => AddProductModel.fromJson(e.data())).toList());
    log(d.toString());
    return d;
  }

  drawerMenulist() {
    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'HomeScreen',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontSize: 30, fontWeight: FontWeight.w700),
            selectedStyle: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const ScreenHome()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Admin',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontSize: 20, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Privacy and Policy',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontSize: 20, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Terms and Conditions',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontSize: 20, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Share the app',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontSize: 20, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'about ',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Feed Back',
            baseStyle: GoogleFonts.montserrat(
                color: kwhite, fontWeight: FontWeight.w700),
            selectedStyle: const TextStyle(),
          ),
          const AdminPanelScreen()),
    ];
  }

  int currentIndex = 0;
  currentindex(int index) {
    currentIndex = index;
    update();
  }

  Future<List<Map<String, dynamic>>> fetchingCategory() async {
    List<Map<String, dynamic>> list = [];
    await FirebaseFirestore.instance
        .collection("allCategory")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    list1 = list;
    log(list.toString());

    categoryCollections = list;
    log(list.toString(), name: "calling");
    update();
    return list;
  }

  Future<void> addProduct(AddProductModel product, String docId) async {
    try {
      final productDocument = _db.collection("allProduct").doc(docId);

      await productDocument.set(product.toJson());
    } catch (e) {
      Future.error('Something went Wrong please try again');
    }
  }

  Future delteCategoryformFireBase(String id) async {
    log(id);
    await FirebaseFirestore.instance.collection("allCategory").doc(id).delete();

    final data =
        FirebaseFirestore.instance.collection("AllProducts").snapshots();
    final d = data.map((event) =>
        event.docs.map((e) => AddProductModel.fromJson(e.data())).toList());
    List<AddProductModel> prod = await d.first;
    for (var element in prod) {
      if (element.category == id) {
        await FirebaseFirestore.instance
            .collection("AllProducts")
            .doc(element.id)
            .delete();
      }
    }
  }
}
