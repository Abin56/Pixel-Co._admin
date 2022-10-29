import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixels_admin/controller/getx/getImage.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/drawer/pages/admin/pages/product_Mangement/widget/add_product_details.dart';

class UploadImageScreen extends StatefulWidget {
  UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  PlatformFile? pickeimagefile;
  UploadTask? uploadTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            const Designone(),
            const DesignTwo(),
            SafeArea(
              child: Scaffold(
                body: ListView(
                  children: [
                    Container(
                      height: 800.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kwhite.withOpacity(0.13)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            kwhite.withOpacity(0.10),
                            kwhite.withOpacity(0.10)
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          const Text(
                            'Upload Image!',
                            style: TextStyle(fontSize: 32),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 200.h,
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                color: Colors.transparent,
                                shape: BoxShape.circle),
                            child: pickeimagefile == null
                                ? const CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    radius: 100,
                                    // child: Image.asset(getimagePath),
                                  )
                                : CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    radius: 100,
                                    backgroundImage: FileImage(
                                      File(pickeimagefile!.path!),
                                    ),
                                  ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            width: 250.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.4),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                              gradient: const LinearGradient(
                                  colors: [Colors.red, Colors.red],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: TextButton.icon(
                                onPressed: () async {
                                  await selectGallery();
                                },
                                icon: const Icon(
                                  Icons.image,
                                  color: kwhite,
                                ),
                                label: const Text(
                                  'Open Gallery',
                                  style: TextStyle(color: kwhite),
                                )),
                          ),
                          SizedBox(height: 50.h),
                          Container(
                            width: 300.w,
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
                                  buildProgress();
                                  await uploadFile();

                                  setState(() {});
                                  // await imageController.uploadImagetoFireBase();
                                },
                                icon: const Icon(
                                  Icons.login,
                                  color: kwhite,
                                ),
                                label: const Text(
                                  'Proceed to next Page',
                                  style: TextStyle(color: kwhite),
                                )),
                          ),
                          buildProgress()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
//  PlatformFile? pickeimagefile;
//   UploadTask? uploadTask;
  Future selectGallery() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      setState(() {
        pickeimagefile = result.files.first;
      });
    }
  }

  Future uploadFile() async {
    final path = "files/Images/${pickeimagefile!.name}";
    final file = File(pickeimagefile!.path!);
    //
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    // Get URL?????????????????????????
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    Get.off(AddProductDetails(
      imagepath: urlDownload,
    ));
    log("Download Link : $urlDownload");
    setState(() {
      uploadTask = null;
    });
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    "${(100 * progress).roundToDouble()}%",
                    style: const TextStyle(color: kwhite),
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox(height: 50.h);
        }
      },);
}
////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////
////////////////////////////////////
///
class DesignTwo extends StatelessWidget {
  const DesignTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 500,
      child: Container(
        height: 200.h,
        width: 200.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 59, 10, 255).withOpacity(0.7),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 200,
            sigmaY: 200,
          ),
          child: Container(
            height: 200.h,
            width: 200.w,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class Designone extends StatelessWidget {
  const Designone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -150,
      left: -100,
      child: Container(
        height: 166,
        width: 166,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 200,
            sigmaY: 200,
          ),
          child: Container(
            height: 200,
            width: 200,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
