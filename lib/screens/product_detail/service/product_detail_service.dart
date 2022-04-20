import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/core/contants/furniture_constants.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/cart/model/cart_model.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

class ProductDetailService {
  final mongoHelper = MongoHelper.instance;

  Future<List<Food>?>? getSimilarFoods(Product product) async {
    if (mongoHelper.db != null) {
      final collection =
          mongoHelper.db!.collection(FoodConstants.instance.collectionName);
      final data = await collection
          .find(where.eq("type", product.type).limit(4))
          .toList();
      final foodList = data.map((e) => Food().fromJson(e)).toList();
      foodList.removeWhere((element) => element.product == product.product);
      if (foodList.length == 4) foodList.removeAt(1);
      return foodList;
    }
    return null;
  }

  Future<Furniture?>? getProductsByProductId(
      Furniture product, String selectedColor) async {
    if (mongoHelper.db != null) {
      final collection =
          mongoHelper.db!.collection(FurnitureConstants.instance.collectionName);
      final data = await collection.findOne(
          where.eq("product_id", '${product.productBaseId}_$selectedColor'));
      return data != null ? Furniture().fromJson(data) : null;
    }
    return null;
  }

  Future<Cart?> getCartItems(DbCollection collection, String? userID) async {
    final response = await collection.findOne(where.eq('user_id', userID));
    if (response != null) {
      final Cart cartResponse = Cart().fromJson(response);
      return cartResponse;
    }
    return null;
  }
}
