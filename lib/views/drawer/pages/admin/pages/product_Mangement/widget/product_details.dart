import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/card_design.dart';

getBottomSheet({required context}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        // ignore: sized_box_for_whitespace
        return SafeArea(
          child: Container(
            color: Colors.black,
            height: 1000.h,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardCustomWidget(),
                    Text(
                      'Sony ILCE-7SM3',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Alpha 7s'),
                    Text(
                      'Rs 333,990',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Discripton'),
                    Text(
                        'Designed for professionals, the α7S III builds on the strengths of the S series such as high sensitivity and wide dynamic range while providing pro features like enhanced AF, optical image stabilisation and 4K 120p35 recording. Incorporating a powerful new engine in its compact body, the camera delivers a wide range of visual experiences.'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 145.w,
                          height: 50.h,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            label: Text(
                              'Edit',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 25, 205, 202),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 145.w,
                          height: 50.h,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            label: Text(
                              'Remove',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
