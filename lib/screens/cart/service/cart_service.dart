import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

class CartService {
  final mongoHelper = MongoHelper.instance;

  Future<List<Product>> getSimilarProducts({Product? product}) async {
    final appConstant = Provider.of<FlavorConfig>(
            NavigationService.instance.navigatorKey.currentContext!,
            listen: false)
        .appConstants;
    if (mongoHelper.db != null) {
      final collection =
          mongoHelper.db!.collection(appConstant!.collectionName);
      final data = product != null ? await collection
          .find(where.eq("type", product.type).limit(10))
          .toList() : await collection
          .find(where.limit(10))
          .toList();
      final foodList = data.map((e) =>
              appConstant is FoodConstants ? Food().fromJson(e) : Furniture().fromJson(e))
          .toList();
      if(product != null) {
        foodList.removeWhere((element) => element.product == product.product);
        if (foodList.length == 10) foodList.removeLast();
      }
      return foodList;
    }
    return [];
  }
}
