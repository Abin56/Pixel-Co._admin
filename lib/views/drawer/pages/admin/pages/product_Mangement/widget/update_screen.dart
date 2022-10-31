import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/edit_and_delete.dart';

import '../../../../../../color/color.dart';

final edit_productNameController = TextEditingController();
final edit_priceontroller = TextEditingController();
final edit_quantityController = TextEditingController();

class UpdateScreen extends StatelessWidget {
  String id;
  UpdateScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UpdateScreenDesgin(id: id),
      ),
    );
  }
}

class UpdateScreenDesgin extends StatelessWidget {
  const UpdateScreenDesgin({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

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
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const Text(
                'Update Details!',
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 30.h),
              TextField(
                controller: edit_productNameController,
                style: const TextStyle(color: kwhite),
                decoration: InputDecoration(
                  focusColor: kwhite,
                  isDense: true,
                  filled: true,
                  fillColor: const Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Product Name',
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
              TextField(
                keyboardType: TextInputType.number,
                controller: edit_priceontroller,
                style: const TextStyle(color: kwhite),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Price',
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusColor: kwhite,
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
              TextField(
                keyboardType: TextInputType.number,
                controller: edit_quantityController,
                style: const TextStyle(color: kwhite),
                decoration: InputDecoration(
                  focusColor: kwhite,
                  isDense: true,
                  filled: true,
                  fillColor: const Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Quantity',
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
                    onPressed: () async {
                      await updateDetails(id: id);
                    },
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
  }
}
