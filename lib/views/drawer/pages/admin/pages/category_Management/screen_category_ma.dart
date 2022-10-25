import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/model/category_model.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/delete_category.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/getbottomsheet.dart';
import '../../../../../color/color.dart';

//

class ScreenCategoryManagement extends StatelessWidget {
  var id;
  final homecontroller = Get.put(Controllers());

  ScreenCategoryManagement({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      appBar: AppBar(
          title: const Text("Category Management"),
          centerTitle: true,
          brightness: Brightness.dark),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("allCategory").snapshots(),
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
                      final data = CategoryModel.fromJson(
                          snapshot.data!.docs[index].data());
                      //
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        columnCount: columnCount,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.fastLinearToSlowEaseIn,
                          scale: 1.8,
                          child: FadeInAnimation(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    await deleteCategory(
                                        context: context, id: data.id);
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        width: 0.1,
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
                                    child:
                                        Center(child: Text(data.categoryName)),
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
        backgroundColor: Colors.grey.shade900,
        onPressed: () {
          getCategoryBottomSheet(
            context: context,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
