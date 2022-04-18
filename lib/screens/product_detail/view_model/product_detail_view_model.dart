import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/enum/view_model_state.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/screens/cart/view_model/cart_view_model.dart';
import 'package:food_furniture_app/screens/product_detail/service/product_detail_service.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:provider/provider.dart';

class ProductDetailViewModel extends BaseViewModel {
  final service = ProductDetailService();
  Product product;
  List<Food> similarProducts = [];
  int piece = 1;

  ProductDetailViewModel(this.product);

  @override
  init() async {
    if (product is Food) {
      await getSimilarFoods();
      notifyListeners();
    }
  }

  Future getSimilarFoods() async {
    similarProducts = (await service.getSimilarFoods(product as Food)) ?? [];
  }

  Future getFurnitureByColor(String selectedColor) async {
    if (product is Furniture) {
      state = ViewModelState.loading;
      final result = await service.getProductsByProductId(
          product as Furniture, selectedColor);
      if (result != null) {
        product = result;
      }
      state = ViewModelState.loaded;
    }
  }

  void getFoodByType(int index) async {
    product = similarProducts[index];
    await getSimilarFoods();
    notifyListeners();
  }

  Future addItemToCart() async {
    product.piece = piece;
    Provider.of<CartViewModel>(
            NavigationService.instance.navigatorKey.currentContext!,
            listen: false)
        .addProduct(product);
    NavigationService.instance.navigateBack();
  }

  Color getColorByString(String colorString) {
    switch (colorString) {
      case "black":
        return Colors.black;
      case "white":
        return Colors.white;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.lightBlueAccent;
      case "brown":
        return Colors.brown;
      case "grey":
        return Colors.grey;
      case "dark_grey":
        return Colors.grey.shade800;
      case "yellow":
        return Colors.amberAccent;
      case "cream":
        return Color(0xFFBFA28A);
      default:
        return Colors.white;
    }
  }
}
