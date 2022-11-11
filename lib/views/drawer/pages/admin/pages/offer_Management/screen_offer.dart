import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/model/offerManagement_Model.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/offer_Management/delete_product.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/offer_Management/upload_image.dart';
import 'package:pixels_admin/views/drawer/pages/admin/widget/desgin_container.dart';

import '../../../../../color/color.dart';
import '../../../../drawer.dart';
import '../product_Mangement/widget/detail_product.dart';
import '../product_Mangement/widget/edit_and_delete.dart';

class ScreenOfferManagement extends StatelessWidget {
  var id;
  ScreenOfferManagement({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    //

    return Scaffold(
      appBar: AppBar(
          title: const Text("Offer Product"),
          leading: IconButton(
              onPressed: () {
                Get.offAll(DrawerWidget());
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          brightness: Brightness.dark),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("OfferProduts").snapshots(),
          builder: (BuildContext,
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
                      final data = OfferManagementModel.fromJson(
                          snapshot.data!.docs[index].data());

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
                                        category: data.offerPrice,
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
                                                overflow: TextOverflow.ellipsis,
                                                "Name: ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
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
                                              Text("Offer:",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey)),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                data.offerPrice,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11),
                                              ),
                                              Text("%",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Price : ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      color: Colors.grey)),
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                data.price,
                                                style: const TextStyle(
                                                    fontSize: 8,
                                                    color: Color.fromARGB(
                                                        255, 23, 255, 31)),
                                              ),
                                              SizedBox(
                                                width: 40.w,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    deleteOfferProduct(
                                                        context: context,
                                                        id:
                                                         id);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
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
          Get.to(UploadImageScreenToOffer());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
