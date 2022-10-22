import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/add_product_details.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/product_details.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/upload_imagetofirebase.dart';
import 'package:pixels_admin/views/drawer/pages/admin/widget/desgin_container.dart';

class ScreenProductMangement extends StatelessWidget {
  const ScreenProductMangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Mangement'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  return getBottomSheet(context: context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 40.0,
                      sigmaY: 40.0,
                    ),
                    child: Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kwhite.withOpacity(0.13)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            kwhite.withOpacity(0.10),
                            kwhite.withOpacity(0.10)
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Name :',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Camera',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Cateorgy:',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Camera',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Icon(
                              color: kwhite, Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: 10),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(UploadImageScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
