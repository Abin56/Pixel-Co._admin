

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/screen_admin.dart';
import 'package:pixels_admin/views/home/screen_home.dart';

List<ScreenHiddenDrawer> pages = [];

class Controllers extends GetxController {

  // String? pickedImage;
  // String? pickedimagefromGallery;
  @override
  void onInit() {
    drawerMenulist();

    super.onInit();
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
          ScreenHome()),
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

  //BottomNavigation <><><><><><><><><
  int currentIndex = 0;
  currentindex(int index) {
    currentIndex = index;
    update();
  }

 
}
