import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/core/contants/furniture_constants.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/util/dummy_data/dummy_data.dart';

class InsertAllData{
  final db = MongoHelper.instance;
  final dummyData = DummyData();
  final appConstants = AppConstants.instance;

  InsertAllData(){
    insertFoodData();
    insertFurnitureData();
    insertFoodCategories();
    insertFurnitureCategories();
  }

  void insertFoodData() async {
    final foodData = dummyData.food;
    await db.insertProductData(FoodConstants.instance.collectionName, foodData);
  }

  void insertFurnitureData() async {
    final furnitureData = dummyData.furniture;
    await db.insertProductData(FurnitureConstants.instance.collectionName, furnitureData);
  }

  void insertFoodCategories() async {
    final foodCategories = dummyData.foodCategories;
    await db.insertCategoryData(FoodConstants.instance.categories, foodCategories);
  }

  void insertFurnitureCategories() async {
    final furnitureCategories = dummyData.furnitureCategories;
    await db.insertCategoryData(FurnitureConstants.instance.categories, furnitureCategories);
  }
}