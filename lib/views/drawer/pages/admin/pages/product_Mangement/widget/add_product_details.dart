import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/drop_down.dart';

import '../../../../../../color/color.dart';
import '../../../../../../core/const.dart';

class AddProductDetails extends StatelessWidget {
  const AddProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        // backgroundColor: Color(0xff7a9bee),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        "Add Product",
                        style: GoogleFonts.montserrat(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(120)),
                              border: Border.all(
                                  color: Color.fromARGB(255, 25, 205, 202))),
                          child: CircleAvatar(
                            radius: 100,
                          )),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo),
                        label: Text('Add photo'),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(kwhite),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 25, 205, 202)))),
                        ),
                      )
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.w,
                              ),
                              Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const DropDownButton()),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
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
                              height: 70,
                              width: 180,
                              child: TextButton.icon(
                                onPressed: () {},
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
}
