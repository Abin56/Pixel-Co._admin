import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixels_admin/views/color/color.dart';

class DetailScreenofProduct extends StatelessWidget {
  String image;
  String productname;
  String price;
  String quantity;
  String category;
  String discription;
  dynamic colorindex;
  DetailScreenofProduct(
      {required this.productname,
      required this.image,
      required this.price,
      required this.category,
      required this.discription,
      required this.quantity,
      required this.colorindex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image.isEmpty
                  ? const CircularProgressIndicator()
                  : CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(image),
                    ),
              productname.isEmpty
                  ? CircularProgressIndicator()
                  : Text(
                      productname,
                      style: TextStyle(fontSize: 40, color: kwhite),
                    ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "💲",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 9, 255, 17)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Text(
                      "Categoey :   ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      category,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Text(
                      "Quantity :    ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      quantity,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                Row(
                  children: [
                    const Text(
                      "About :     ",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    Text(
                      discription,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
