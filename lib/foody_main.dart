import 'package:food_furniture_app/core/contants/food_constants.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/main.dart';

void main() {
  final foodyConfig =
      FlavorConfig(applicationType: Application.food, appTitle: "Foody", appConstants: FoodConstants());

  mainCommon(foodyConfig);
}
