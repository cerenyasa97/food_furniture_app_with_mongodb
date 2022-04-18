import 'dart:math';

import 'package:food_furniture_app/core/base/base_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Product extends BaseModel {
  Product(
      {this.id,
      this.brand,
      this.type,
      this.price,
      this.image,
      this.product,
      this.imageType,
      this.rating,
      this.description,
      this.piece,
      this.productType});

  ObjectId? id;
  String? brand;
  String? type;
  double? price;
  String? image;
  String? product;
  String? imageType;
  String? description;
  double? rating;
  int? piece;
  String? productType;

  @override
  Product fromJson(Map<String, dynamic> json) => Product(
      id: json["_id"],
      brand: json["brand"],
      type: json["type"],
      price: json["price"].toDouble(),
      image: json["image"],
      imageType: json["image_type"],
      product: json["product"],
      description: json["description"],
      rating: json["rating"],
      piece: json["piece"],
      productType: json["product_type"]);

  @override
  Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "type": type,
        "price": price,
        "image": image,
        "image_type": imageType,
        "product": product,
        "description": description,
        "rating": rating,
        "piece": piece,
        "product_type": productType
      };
}
