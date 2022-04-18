import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Food extends Product {
  Food({ObjectId? id,
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
    this.weight,
    this.weightType,
    this.ingredients})
      : super(
      id: id,
      brand: brand,
      type: type,
      price: price,
      image: image,
      product: product,
      description: description,
      rating: rating,
      piece: piece,
      productType: productType
  );

  int? weight;
  int? weightType; // 0 -> gram, 1 -> kilogram, 2 -> piece
  List<String>? ingredients;

  @override
  Food fromJson(Map<String, dynamic> json) =>
      Food(
          id: json["_id"],
          brand: json["brand"],
          type: json["type"],
          price: json["price"].toDouble(),
          image: json["image"],
          imageType: json["image_type"],
          product: json["product"],
          weight: json["weight"],
          weightType: json["weight_type"],
          description: json["description"],
          ingredients: List<String>.from(json["ingredients"].map((x) => x)),
          rating: json["rating"],
          piece: json["piece"]
      );

  @override
  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "brand": brand,
        "type": type,
        "price": price,
        "image": image,
        "product": product,
        "weight": weight,
        "weight_type": weightType,
        "description": description,
        "ingredients": ingredients != null
            ? List<String>.from(ingredients!.map((x) => x))
            : null,
        "rating": rating,
        "piece": piece
      };
}
