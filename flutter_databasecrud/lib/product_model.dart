import 'package:flutter/foundation.dart';

class ProductModel {
  int? id;
  String? name;
  String? category;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.id, this.name, this.category, this.createdAt, this.updatedAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
