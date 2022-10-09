import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/widget/desgin_container.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  final homeController = Get.put(Controllers());
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    homeController.onInit();
    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: const Color.fromARGB(255, 58, 58, 58),
      initPositionSelected: 0,
      slidePercent: 80,
      contentCornerRadius: 40,
      backgroundColorAppBar: Colors.grey[300],
      styleAutoTittleName: GoogleFonts.poppins(
          color: backgroundColor, fontSize: 25, fontWeight: FontWeight.w600),
      leadingAppBar: Icon(
        Icons.menu,
        color: backgroundColor,
      ),
    );
  }
}
