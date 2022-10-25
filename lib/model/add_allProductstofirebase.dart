// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) =>
    AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) =>
    json.encode(data.toJson());

class AddProductModel {
  AddProductModel({
    this.id,
    required this.productImage,
    required this.productName,
    required this.price,
    required this.category,
    required this.quantity,
    required this.discription,
    this.available,
  });

  String? id;
  String productImage;
  String productName;
  String price;
  String category;
  String quantity;
  String discription;

  bool? available;

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      AddProductModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"],
        productName: json["productName"],
        price: json["Price"],
        category: json["Category"],
        quantity: json["quantity"],
        discription: json["discription"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductImage": productImage,
        "productName": productName,
        "Price": price,
        "Category": category,
        "quantity": quantity,
        "discription": discription,
        "available": available,
      };
}
