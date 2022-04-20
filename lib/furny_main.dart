import 'package:food_furniture_app/core/contants/furniture_constants.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/main.dart';

void main() {
  final furnyConfig = FlavorConfig(
      applicationType: Application.furniture,
      appTitle: "Furny",
      appConstants: FurnitureConstants.instance);

  mainCommon(furnyConfig);
}
