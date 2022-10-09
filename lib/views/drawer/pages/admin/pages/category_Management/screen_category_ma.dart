import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/listdesgin.dart';

class ScreenCategoryManagement extends StatelessWidget {
  const ScreenCategoryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: backgroundColor),
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                var rnd = Random();
                var r = 1 + rnd.nextInt(5 - 1);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListContainerWidget(
                      colorindex: r, text: cameralist[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemCount: cameralist.length)),
    );
  }
}

List<String> cameralist = [
  'Compact Cameras',
  'DSLR Cameras',
  'Mirrorless Cameras',
  'Action Cameras',
  '360 Cameras',
  'Medium Format Cameras',
  'Traditional Film Cameras',
];
