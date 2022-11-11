import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/views/color/color.dart';

class UpdateCategory extends StatelessWidget {
  final homeController = Get.put(Controllers());
  final categoryController = TextEditingController();
  UpdateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: kwhite.withOpacity(0.13)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [kwhite.withOpacity(0.10), kwhite.withOpacity(0.10)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              const Text(
                'Update Details!',
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 30.h),
              TextField(
                controller: categoryController,
                style: const TextStyle(color: kwhite),
                decoration: InputDecoration(
                  focusColor: kwhite,
                  isDense: true,
                  filled: true,
                  fillColor: const Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Category Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              SizedBox(height: 70.h),
              Container(
                width: 250.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  gradient: const LinearGradient(
                      colors: [Colors.green, Colors.green],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                child: TextButton.icon(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.handyman,
                      color: kwhite,
                    ),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: kwhite),
                    )),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
