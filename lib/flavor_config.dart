import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';

enum Application { food, furniture, nan }

class FlavorConfig extends ChangeNotifier{
  String appTitle;
  Application applicationType;
  AppConstants? appConstants;

  FlavorConfig({this.appTitle = "Flavor Tutorial", this.applicationType = Application.nan, this.appConstants});
}
