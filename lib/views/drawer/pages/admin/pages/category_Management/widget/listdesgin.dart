// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/widget/neumorphism_widget.dart';

// ignore: must_be_immutable
class ListContainerWidget extends StatelessWidget {
  String text;

  var colorindex;
  ListContainerWidget({
    super.key,
    required this.text,
    required this.colorindex,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphismWidget(
      blurRadius: 15,
      color: kwhite,
      height: 100.h,
      padding: 0,
      borderRadius: BorderRadius.circular(30),
      widget: Padding(
        padding: const EdgeInsets.all(20),
        child: NeumorphismWidget(
          blurRadius: 1,
          color: listcolors[colorindex].first.withOpacity(0.8),
          height: 90.h,
          padding: 0,
          borderRadius: BorderRadius.circular(30),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
              ),
              NeumorphismCircleWidget(
                height: 48.h,
                padding: 10,
                widget: const Icon(Icons.camera_enhance_outlined),
              ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                text,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  // color: listcolors[colorindex].first
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
