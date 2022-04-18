import 'package:food_furniture_app/core/base/base_model.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';

class Cart extends BaseModel{
  Cart({this.userID, this.cart});

  String? userID;
  List<Product>? cart = [];

  @override
  fromJson(Map<String, dynamic> json) => Cart(
    userID: json["user_id"],
      cart: json["cart"] != null
          ? List<Product>.from((json["cart"]?.map((
          e) =>
              e["product_type"] != "food"
                  ? Furniture().fromJson(e)
                  : Food().fromJson(e))))
          : []);

  @override
  Map<String, dynamic> toJson() => {
    "user_id": userID,
    "cart": cart != null ? cart!.map((e) => e.toJson()).toList() : null
  };
}