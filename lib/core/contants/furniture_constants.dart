import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';

class FurnitureConstants extends AppConstants {
  @override
  String get loginImagePath => 'assets/images/furniture.png';

  @override
  String get categories => 'furniture_categories';

  @override
  String get collectionName => 'furniture';

  @override
  Color get loginTextFieldBackgroundColor => Color(0xFFEDE1D1);

  @override
  Color get loginTextFieldTextColor => Color(0xFFaf8552);

  @override
  String get homeDescription => 'Best Furnitures for\nyour home...';
}
