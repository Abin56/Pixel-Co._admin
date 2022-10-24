import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/detail_product.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/edit_and_delete.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/upload_imagetofirebase.dart';
import '../../../../../../model/add_allProductstofirebase.dart';
import '../../../../../color/color.dart';

//

class ScreenProductMangement extends StatelessWidget {
  var id;

  final homecontroller = Get.put(Controllers());

  ScreenProductMangement({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return Scaffold(
      appBar: AppBar(
          title: const Text("All Product"),
          centerTitle: true,
          brightness: Brightness.dark),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("ProductList").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            //
            if (snapshot.hasData) {
              return AnimationLimiter(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    snapshot.data!.docs.length,
                    (int index) {
                      //
                      final data = AddProductModel.fromJson(
                          snapshot.data!.docs[index].data());
                      //
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.fastLinearToSlowEaseIn,
                          scale: 1.9,
                          child: FadeInAnimation(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: GestureDetector(
                                  onTap: () {
                                    var rnd = Random();
                                    var r = 1 + rnd.nextInt(5 - 1);
                                    Get.to(DetailScreenofProduct(
                                        colorindex: r,
                                        productname: data.productName,
                                        image: data.productImage,
                                        price: data.price,
                                        category: data.category,
                                        discription: data.discription,
                                        quantity: data.quantity));
                                  },
                                  child: Container(
                                    height: 400.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        width: 0.3,
                                        color: kwhite,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          kwhite.withOpacity(0.10),
                                          kwhite.withOpacity(0.10)
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 33.r,
                                            backgroundColor: backgroundColor,
                                            backgroundImage:
                                                NetworkImage(data.productImage),
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Name: ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                data.productName,
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text("Category: ",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                              Text(
                                                data.category,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 7),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Price :",
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                              Text(
                                                data.price,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 23, 255, 31)),
                                              ),
                                              SizedBox(
                                                width: 40.w,
                                              ),
                                              EditandDelete(
                                                id: data.id,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.grey.shade800,
              ));
            }
            //
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {
          Get.to(UploadImageScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
