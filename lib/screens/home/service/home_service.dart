import 'package:food_furniture_app/core/base/base_model.dart';
import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/screens/home/model/category.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../util/dummy_data/model/food.dart';

class HomeService {
  final mongoHelper = MongoHelper.instance;

  Future<List<Product>?>? getFiveRandomProduct(String col) async {
    if (mongoHelper.db != null) {
      final collection = mongoHelper.db!.collection(col);
      final data = await collection.find(where.limit(5)).toList();
      return data.map((element) => col == FoodConstants.instance.collectionName
                    ? Food().fromJson(element)
                    : Furniture().fromJson(element)).toList();
    }
  }

  Future<List<Product>?>? getProductsByCategory(String col, String category) async {
    if (mongoHelper.db != null) {
      final collection = mongoHelper.db!.collection(col);
      final data = await collection.find(where.eq("type", category)).toList();
      return data.map((element) => col == FoodConstants.instance.collectionName
          ? Food().fromJson(element)
          : Furniture().fromJson(element)).toList();
    }
  }

  Future<List<String>?>? getCategories(String col) async {
    if (mongoHelper.db != null) {
      final collection = mongoHelper.db!.collection(col);
      final data = await collection.find().toList();
      return Category().fromJson(data.first).categories;
    }
  }
}
