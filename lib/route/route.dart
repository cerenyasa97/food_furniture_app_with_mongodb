import 'package:flutter/material.dart';
import 'package:food_furniture_app/screens/cart/screen/cart.dart';
import 'package:food_furniture_app/screens/home/screen/home.dart';
import 'package:food_furniture_app/screens/login/screen/login.dart';
import 'package:food_furniture_app/screens/product_detail/screen/product_detail.dart';
import 'package:food_furniture_app/screens/profile/screen/profile.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';

class AppRoute {
  static const login = '/';
  static const home = '/home';
  static const profile = '/profile';
  static const detail = '/detail';
  static const cart = '/cart';

  static Route<Object>? generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => SafeArea(
              bottom: true,
              top: false,
              child: _buildPage(settings.name, settings.arguments),
            ));
  }

  static Widget _buildPage(
    String? name,
    Object? argument,
  ) {
    switch (name) {
      case login:
        return const Login();
      case home:
        return const Home();
      case profile:
        return const Profile();
      case detail:
        return ProductDetail(product: argument as Product,);
      case cart:
        return const Cart();
      default:
        return Container();
    }
  }
}
