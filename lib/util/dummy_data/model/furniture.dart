import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Furniture extends Product {
  Furniture(
      {ObjectId? id,
      String? brand,
      String? type,
      double? price,
      String? image,
      String? product,
      String? imageType,
      String? description,
      double? rating,
      int? piece,
      String? productType,
      this.color,
      this.productBaseId,
      this.productId,
      this.colorOptions})
      : super(
            brand: brand,
            type: type,
            price: price,
            image: image,
            product: product,
            description: description,
            rating: rating,
            piece: piece,
            productType: productType);

  String? color;
  String? productId;
  String? productBaseId;
  List<String>? colorOptions;

  @override
  Furniture fromJson(Map<String, dynamic> json) => Furniture(
      id: json["_id"],
      brand: json["brand"],
      type: json["type"],
      price: json["price"].toDouble(),
      image: json["image"],
      imageType: json["image_type"],
      product: json["product"],
      description: json["description"],
      color: json["color"],
      productBaseId: json["product_base_id"],
      productId: json["product_id"],
      rating: json["rating"],
      colorOptions: List<String>.from(json["color_options"].map((x) => x)),
      piece: json["piece"]);

  @override
  Map<String, dynamic> toJson() => {
        "brand": brand,
        "type": type,
        "price": price,
        "image": image,
        "product": product,
        "color": color,
        "description": description,
        "product_id": productId,
        "product_base_id": productBaseId,
        "color_options": colorOptions != null
            ? List<String>.from(colorOptions!.map((x) => x))
            : null,
        "rating": rating,
        "_id": id,
        "piece": piece
      };
}
