// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.id,
    required this.categoryName,
  });

  String? id;
  String categoryName;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? "",
        categoryName: json["CategoryName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "CategoryName": categoryName,
      };
}
