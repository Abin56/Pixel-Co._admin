import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pixels_admin/controller/firebase/add_category.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/views/home/screen_home.dart';
import '../../../../../../color/color.dart';
import '../screen_category_ma.dart';

getCategoryBottomSheet({
  required context,
}) async {
  // final bottomController = Get.put(Controllers());
  final textController = TextEditingController();
  // String image = '';
  // final homecontroller = Get.put(Controllers());
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        // ignore: sized_box_for_whitespace
        return Container(
          // color: backgroundColor,
          height: 200.h,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  cursorColor: backgroundColor,
                  controller: textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '          Category Name',
                  ),
                  style: const TextStyle(
                      color: backgroundColor,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200.w,
                  height: 60.h,
                  child: ElevatedButton.icon(
                    //
                    onPressed: () async {
                      final categoryname = textController.text.trim();
                      // final categoryImage =
                      //     bottomController.pickedfile!.path!;
                      if (categoryname.isEmpty) {
                        Get.snackbar("Error", "Cateogry field empty",
                            backgroundColor: Colors.red, colorText: kwhite);
                      } else {
                        await AddCategoryToFireBase().addCategory(categoryname);
                        // Get.back();

                        // await Get.offAll(ScreenCategoryManagement());
                      }
                      // bottomController.update();
                      // await bottomController.clearPicked();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'Add ',
                      // style: GoogleFonts.montserrat(),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                // IconButton(
                //   onPressed: () async {
                //     await bottomController.uploadImagetoFireBase();
                //     // await bottomController.addProductImage(bottomController.pickedfile!);
                //     // log(bottomController
                //     //     .uploadImagetoFireBase()
                //     //     .toString());
                //   },
                //   icon: Icon(Icons.add),
                // )
              ],
            ),
          ),
        );
      });
}
