import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/core/const.dart';

class ScreenAdminProfile extends StatelessWidget {
  const ScreenAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color.fromARGB(255, 25, 205, 202)
      backgroundColor: const Color.fromARGB(213, 3, 3, 3),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                const SizedBox(height: 160),
                Text(
                  'Admin',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                kwidth,
                Text(
                  'Profile',
                  style: GoogleFonts.montserrat(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              height: 694.h,
              // width: 500.w,
              decoration: const BoxDecoration(
                  color: kwhite,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    // backgroundImage: FileImage(File(dataList.image!)),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Details',
                        style: GoogleFonts.montserrat(
                            // color: Colors.,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     TextButton.icon(
                  //       onPressed: () {},
                  //       icon: const Icon(Icons.update),
                  //       label: Text("UpDate   ",
                  //           style: GoogleFonts.montserrat(
                  //               color: Colors.green,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w700)),
                  //       style: ButtonStyle(
                  //         foregroundColor: MaterialStateProperty.all(kwhite),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(backgroundColor),
                  //         shape:
                  //             MaterialStateProperty.all<RoundedRectangleBorder>(
                  //                 RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     side: const BorderSide(
                  //                         color: Color.fromARGB(
                  //                             255, 25, 205, 202)))),
                  //       ),
                  //     ),
                  //     TextButton.icon(
                  //       onPressed: () async {},
                  //       icon: const Icon(Icons.home),
                  //       label: Text(
                  //         "Home ",
                  //         style: GoogleFonts.montserrat(
                  //             color: Colors.amber,
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w700),
                  //       ),
                  //       style: ButtonStyle(
                  //         foregroundColor: MaterialStateProperty.all(kwhite),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(backgroundColor),
                  //         shape:
                  //             MaterialStateProperty.all<RoundedRectangleBorder>(
                  //                 RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     side: const BorderSide(
                  //                         color: Color.fromARGB(
                  //                             255, 25, 205, 202)))),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
