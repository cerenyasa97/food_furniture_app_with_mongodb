import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';

class FoodConstants extends AppConstants{
  String get collectionName => 'food';
  @override
  String get categories => 'food_categories';
  @override
  String get loginImagePath => 'assets/images/food.png';
  @override
  Color get loginTextFieldBackgroundColor => Color(0xFFC1CACC);
  @override
  Color get loginTextFieldTextColor => Colors.white;
  @override
  String get homeDescription => 'Best Foods for\nyou...';
}