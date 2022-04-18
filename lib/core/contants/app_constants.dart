import 'package:flutter/material.dart';

class AppConstants{
  String get mongoDbUrl => 'mongodb+srv://cerenyasa:123qwe@cluster0.iahiu.mongodb.net/food-furniture?retryWrites=true&w=majority';
  String get cartCollectionName => 'cart_by_user';
  String get categories => '';
  String get userDb => 'users';
  String get loginImagePath => '';
  Color get loginTextFieldBackgroundColor => Colors.white;
  Color get loginTextFieldTextColor => Colors.white;
  Color get buttonColor => Color(0xFF3A4F4F);
  Color get grey => Color(0xFFEAEAEA);
  String get homeDescription => '';
  String get collectionName => '';
  String get notFoundImages => "assets/images/not_found.json";
}