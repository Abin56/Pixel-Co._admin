import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class GetImageController extends GetxController {
  PlatformFile? pickedfile;

  UploadTask? uploadTask;
  Future getGallery() async {
    // final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    // pickedimagefromGallery = images!.path;
    // update();
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      pickedfile = result.files.first;
    
      // log(pickedfile!.path!.toString());
      // final String imagepath = pickedfile!.path!.toString();
      // return imagepath;
    }

    // return pickedfile;
  }

  // clearPicked() {
  //   pickedImage = null;
  // }

  //
//
  Future uploadImagetoFireBase() async {
    try {
      final path = "files/${pickedfile!.name}";
      final file = File(pickedfile!.path!);
      // log(pickedfile!.path!);
      // log(file.path.toString());
      // final imagepath = file.path.toString();

      //
      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);

      //

      //
      //Uploading ...............
      // final snapshot = await uploadTask!.whenComplete(() {});
      // final urlDownload = await snapshot.ref.getDownloadURL();
      // print('Download Link>>>>>>>>>>>>>>>>>>..$urlDownload');
      // update();

    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

  addProductImage(File filepath) async {
    try {
      final ref = FirebaseStorage.instance
          .ref("Product images/$filepath")
          .child("all Product Image");
      await ref.putFile(filepath).then((p0) async {
        // Get.snackbar("message", "Image added Successfully",
        // backgroundColor: kgreen, colorText: kwhite);
      });
      final urlDownload = await ref.getDownloadURL();
      return urlDownload;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
