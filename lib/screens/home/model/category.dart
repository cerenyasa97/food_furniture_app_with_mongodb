import 'package:food_furniture_app/core/base/base_model.dart';

class Category extends BaseModel {
  Category({this.categories});

  List<String>? categories;

  @override
  Category fromJson(Map<String, dynamic> json) =>
      Category(categories: List<String>.from(json["categories"]));

  @override
  Map<String, dynamic> toJson() => {"categories": categories};
}
