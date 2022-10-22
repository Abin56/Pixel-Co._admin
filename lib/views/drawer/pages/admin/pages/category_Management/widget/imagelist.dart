
// //
// import 'dart:math';
// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pixels_admin/model/category_model.dart';
// import 'package:pixels_admin/views/color/color.dart';
// import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/getbottomsheet.dart';
// import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/imagelist.dart';
// import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/listdesgin.dart';
// import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/listofC.dart';
// import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/product_details.dart';
// import 'package:pixels_admin/views/widget/glass_Container.dart';

// class ScreenCategoryManagement extends StatelessWidget {
//   ScreenCategoryManagement({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: -150,
//             left: 100,
//             child: Container(
//               height: 200,
//               width: 200,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color.fromARGB(255, 255, 25, 0).withOpacity(0.9),
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(
//                   sigmaX: 200,
//                   sigmaY: 200,
//                 ),
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   color: Colors.transparent,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 500,
//             child: Container(
//               height: 200,
//               width: 200,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color.fromARGB(255, 59, 10, 255).withOpacity(0.7),
//               ),
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(
//                   sigmaX: 200,
//                   sigmaY: 200,
//                 ),
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   color: Colors.transparent,
//                 ),
//               ),
//             ),
//           ),
//           SafeArea(
//             child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection("allCategory")
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                         snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Category Management',
//                           style: TextStyle(fontSize: 30),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Expanded(
//                           child: GridView.count(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 20,
//                             crossAxisSpacing: 15,
//                             childAspectRatio: 1.1 / 1.5,
//                             shrinkWrap: true,
//                             children: List.generate(
//                               snapshot.data!.docs.length,
//                               (index) {
//                                 print(snapshot.data!.docs.length);
//                                 final data = CategoryModel.fromJson(
//                                     snapshot.data!.docs[index].data());
//                                 //

//                                 //
//                                 return Builder(builder: (context) {
                                  
//                                   // var rnd = Random();
//                                   // var r = 1 + rnd.nextInt(5 - 1);
//                                   return GlassContainer(
//                                     height: 400,
//                                     width: 400,
//                                     image: '',
//                                     title: data.categoryName,
//                                   );
//                                 });
//                               },
//                             ),
//                           ),
//                         )
//                       ],
//                     );
//                   } else {
//                     return CircularProgressIndicator();
//                   }
//                 }),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: kwhite.withOpacity(0.2),
//         onPressed: () {
//           getCategoryBottomSheet(context: context, getimagePath: '');
//           // Get.to(ListofImages());
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// List<String> cameralist = [
//   'Compact Cameras',
//   'DSLR Cameras',
//   'Mirrorless Cameras',
//   'Action Cameras',
//   '360 Cameras',
//   'Medium Format Cameras',
//   'Traditional Film Cameras',
// ];