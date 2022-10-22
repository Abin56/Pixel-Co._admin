import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_admin/views/color/color.dart';

class GlassContainer extends StatelessWidget {
  int height;
  int width;
  String title;
  String image;
  GlassContainer(
      {required this.image,
      required this.title,
      required this.height,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 0.1,
          color: kwhite,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [kwhite.withOpacity(0.10), kwhite.withOpacity(0.10)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 100,
              width: 130,
              child: Image.network(image),
            ),
          ],
        ),
      ),
    );
  }
}
