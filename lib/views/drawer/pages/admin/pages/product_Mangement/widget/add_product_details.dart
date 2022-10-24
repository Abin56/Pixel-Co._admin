import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/controller/firebase/add_AllProduct.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';
import 'package:pixels_admin/model/category_model.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/category_Management/widget/getbottomsheet.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/screen_product_M.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/drop_down.dart';

import '../../../../../../color/color.dart';
import '../../../../../../core/const.dart';

class AddProductDetails extends StatelessWidget {
  final produtnameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final discriptionController = TextEditingController();
  CategoryModel? categoryda;

  final String imagepath;
  AddProductDetails({required this.imagepath, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        // backgroundColor: Color(0xff7a9bee),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                const AppBarProduct(),
                Positioned(
                    top: 130,
                    child: Container(
                      height: 1000,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(30)),
                    )),
                Positioned(
                  top: 100,
                  left: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(120)),
                            image: DecorationImage(
                                image: NetworkImage(imagepath),
                                fit: BoxFit.contain),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 25, 205, 202))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -1,
                  right: -1,
                  bottom: -30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: kwhite,
                      height: MediaQuery.of(context).size.height - 300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: produtnameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Product Name',
                              icon: Icon(Icons.camera_outlined),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              // if(value==null){
                              //   return 'Invalid Name is empty';

                              // }else if(getplaylistsatus(namepath: value)){
                              //   return 'Alreay exist';

                              // }
                            },
                          ),
                          kheight,
                          kheight,
                          TextFormField(
                            controller: priceController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Price',
                              icon: Icon(Icons.attach_money_rounded),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          kheight,
                          TextFormField(
                            controller: quantityController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Quantity',
                              icon: Icon(Icons.production_quantity_limits),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const DropDownButton(),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: discriptionController,
                            maxLines: 7,
                            decoration: InputDecoration(
                              labelText: "Discriptions",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 0.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 0.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                            ),
                          ),
                          kheight,
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 60.h,
                              width: 180.w,
                              child: TextButton.icon(
                                onPressed: () async {
                                  // User? user =
                                  //     FirebaseAuth.instance.currentUser;
                                  final productName =
                                      produtnameController.text.trim();
                                  final price = priceController.text.trim();
                                  final quantity =
                                      quantityController.text.trim();
                                  final discription =
                                      discriptionController.text.trim();
                                  ////////////////////////////
                                  if (productName.isNotEmpty &&
                                      price.isNotEmpty &&
                                      quantity.isNotEmpty &&
                                      discription.isNotEmpty) {
                                    final addtoFireBase = AddProductModel(
                                        productImage: imagepath,
                                        productName: productName,
                                        price: price,
                                        category: dropDownValue!,
                                        quantity: quantity,
                                        discription: discription,
                                        available: true);
                                    await AddProductDetailsToFireBase()
                                        .addProductController(addtoFireBase);
                                  

                                  } else {
                                    return;
                                  }
                                },
                                icon: const Icon(Icons.person_add),
                                label: Text("Add Product",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(kwhite),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 25, 205, 202),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//     selectDropList(context) async {
//   return showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     builder: (ctx) {
//       // ignore: sized_box_for_whitespace
//       return Container(
//         height: 250.h,
//         child: DropDownButton(categorydata: ),
//       );
//     },
//   );
// }
}

class AppBarProduct extends StatelessWidget {
  const AppBarProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
          ),
          Text(
            "Add Product",
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
