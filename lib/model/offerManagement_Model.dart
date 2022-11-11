// To parse this JSON data, do
//
//     final OfferManagementModel = OfferManagementModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

OfferManagementModel OfferManagementModelFromJson(String str) =>
    OfferManagementModel.fromJson(json.decode(str));

String OfferManagementModelToJson(OfferManagementModel data) =>
    json.encode(data.toJson());

class OfferManagementModel {
  OfferManagementModel({
    this.id,
    required this.productImage,
    required this.productName,
    required this.price,
    required this.offerPrice,
    required this.quantity,
    required this.discription,
    this.available,
  });

  String? id;
  String productImage;
  String productName;
  String price;
  String offerPrice;
  String quantity;
  String discription;

  bool? available;

  factory OfferManagementModel.fromJson(Map<String, dynamic> json) =>
      OfferManagementModel(
        id: json["id"] ?? '',
        productImage: json["ProductImage"] ?? "",
        productName: json["productName"] ?? "",
        price: json["Price"] ?? "",
        offerPrice: json["OfferPrice"] ?? "",
        quantity: json["quantity"],
        discription: json["discription"] ?? "",
        available: json["available"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductImage": productImage,
        "productName": productName,
        "Price": price,
        "OfferPrice": offerPrice,
        "quantity": quantity,
        "discription": discription,
        "available": available,
      };
}
