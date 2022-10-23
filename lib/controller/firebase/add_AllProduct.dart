import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixels_admin/model/add_allProductstofirebase.dart';

class AddProductDetailsToFireBase {
  Future addProductController(AddProductModel productModel) async {
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection("ProductList")
        .add(productModel.toJson())
        .then((value) => {});
  }
}
