import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/widget/desgin_container.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      // backgroundColor: Colors.black,
      // extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 1.2 / 1.4,
              shrinkWrap: true,
              children: List.generate(7, (index) {
                return Builder(builder: (context) {
                  var rnd = Random();
                  var r = 1 + rnd.nextInt(5 - 1);
                  return ContainerWidget(
                    index: index,
                    color: r,
                  );
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}
      // ListView.separated(
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: ContainerWidget(
      //           index: index,
      //         ),
      //       );
      //     },
      //     separatorBuilder: (context, index) {
      //       return SizedBox(
      //         height: 22.h,
      //       );
      //     },
      //     itemCount: 7),
