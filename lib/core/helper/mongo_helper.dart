import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:food_furniture_app/util/dummy_data/model/product_image.dart';
import 'package:food_furniture_app/util/dummy_data/mongo_insert_all_data.dart';
import 'package:food_furniture_app/screens/login/model/user.dart';
import 'package:mime/mime.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoHelper {
  static MongoHelper? _instance;

  static MongoHelper get instance => _instance ??= MongoHelper._();

  final appConstants = AppConstants();
  User? user;

  MongoHelper._() {
    dbInit();
  }

  Db? db;

  void dbInit() async {
    db = await Db.create(appConstants.mongoDbUrl);
    if (db != null) {
      await db!.open();

      // TODO: Execute this command to insert the data to be used in the application into mongoDb.
      // InsertAllData();

      getFoods();
    }
  }

  Future insertCategoryData(String dbName, List<String> data) async {
    final collection = db!.collection(dbName);
    collection.insert({'categories': data});
  }

  Future insertProductData(String dbName, List<Product> data) async {
    try {
      final collection = db!.collection(dbName);
      if (db != null) {
        GridFS bucket = GridFS(db!, "image");
        await Future.forEach(data, (Product product) async {
          if (product.image != null) {
            final compressedImage = await _compressImage(product.image!);
            if (compressedImage != null) {
              final productImage = ProductImage(
                  product.image!.split('/').last,
                  base64Encode(compressedImage),
                  lookupMimeType(product.image!)!);
              bucket.chunks.insert(productImage.toJson());
            }
          }
          collection.insert(product.toJson());
        });
      }
    } catch (e) {
      debugPrint("Error ocured data inserting to MongoDb\n$e");
    }
  }

  Future<Uint8List?> _compressImage(String imageAsset) async {
    Uint8List? compressedImage;
    try {
      compressedImage = await FlutterImageCompress.compressAssetImage(
          imageAsset,
          format: _getCompressFormat(lookupMimeType(imageAsset)!),
          quality: 70);
      return compressedImage;
    } catch (e) {
      debugPrint("Error occured image compression phase\n$e");
    }
    return null;
  }

  CompressFormat _getCompressFormat(String mime) {
    switch (mime) {
      case 'image/jpg':
      case 'image/jpeg':
        return CompressFormat.jpeg;
      case 'image/png':
        return CompressFormat.png;
      default:
        return CompressFormat.heic;
    }
  }

  Future<List<Map<String, dynamic>>?> getProduct(String dbName) async {
    if (db != null) {
      var coll = db!.collection(dbName);
      return await coll.find().toList();
    }
    return null;
  }

  Future<List<Food>?> getFoods() async {
    if (db != null) {
      final foodList = await getProduct(FoodConstants().collectionName);
      if (foodList != null) {
        final foods = List<Food>.from(foodList.map((x) => Food().fromJson(x)));
        return foods;
      }
    }
    return null;
  }

  Future<bool> login(User userInfo) async {
    if (db != null) {
      var coll = db!.collection(appConstants.userDb);
      final response = await coll
          .find({'email': userInfo.email, "password": userInfo.password}).toList();
      user = User().fromJson(response.first);
      if (![user?.name, user?.surname]
          .contains(null)) {
        return true;
      }
    }
    return false;
  }
}
