import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/Coupen_Management/screen_coupen.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/admin_Profile/screen_adminprofile.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/screen_category_ma.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/offer_Management/screen_offer.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/screen_product_M.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/statitcs%20and%20Earnings/screen_statitcsEarnings.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/user_Mangement/screen_userManagement.dart';
import 'package:pixels_admin/views/widget/neumorphism_widget.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  int index;

  // ignore: prefer_typing_uninitialized_variables

  ContainerWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(screen[index]);
          },
          child: NeumorphismWidget(
            blurRadius: 15,
            color: kwhite,
            height: 100.h,
            padding: 20,
            borderRadius: BorderRadius.circular(30),
            widget: Row(
              children: [
                NeumorphismCircleWidget(
                  height: 100.h,
                  padding: 10,
                  widget: Icon(
                    icons[index],
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  textstring[index],
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

List<String> textstring = [
  'User Mangement',
  'Product Management',
  'Statitics and Earnings',
  'Offer management',
  'Category Management',
  'Coupen Management',
  'Admin Profile',
];
List<IconData> icons = [
  Icons.accessibility_new_outlined,
  Icons.settings_suggest_outlined,
  Icons.bar_chart_outlined,
  Icons.local_offer_outlined,
  Icons.category_outlined,
  Icons.theaters_rounded,
  Icons.admin_panel_settings_outlined
];
List screen = const [
  ScreenUserManagement(),
  ScreenProductMangement(),
  ScreenStatitcsAndEarnings(),
  ScreenOfferManagement(),
  ScreenCategoryManagement(),
  ScreenCoupenManagement(),
  ScreenAdminProfile(),
];
// Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 24,
//               spreadRadius: 16,
//               color: Colors.black.withOpacity(0.2),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16.0),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(
//               sigmaX: 40.0,
//               sigmaY: 40.0,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(screen[index]);
//               },
//               child: Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(22),
//                   ),
//                   border: Border.all(
//                     width: 1.2,
//                     color: Colors.white.withOpacity(1),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Icon(
//                       icons[index],
//                       size: 28,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(
//                       width: 14,
//                     ),
//                     Text(
//                       textstring[index],
//                       style: GoogleFonts.montserrat(
//                           fontSize: 20, fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),