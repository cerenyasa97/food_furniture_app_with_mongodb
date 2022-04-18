import 'dart:math';

import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/core/widgets/dialog/alert_dialog.dart';
import 'package:food_furniture_app/route/route.dart';
import 'package:food_furniture_app/screens/cart/service/cart_service.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';

class CartViewModel extends BaseViewModel {
  final service = CartService();

  List<Product> cartProducts = [];
  List<Product> similarProducts = [];

  @override
  Future<void> init() async {
    if (cartProducts.isNotEmpty) {
      await getSimilarProducts();
    }
    return super.init();
  }

  Future<void> getSimilarProducts() async {
    similarProducts =
        await service.getSimilarProducts(product: cartProducts.isNotEmpty ? cartProducts[0] : null);
    notifyListeners();
  }

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  void addProduct(Product product) async {
    if (cartProducts.any((element) =>
        element.brand == product.brand && element.product == product.product)) {
      final item = cartProducts.firstWhere((element) =>
          element.brand == product.brand && element.product == product.product);
      if (item.piece != null) {
        final piece = product.piece! + item.piece!;
        item.piece = piece;
      }
    } else {
      cartProducts.add(product);
    }
    await getSimilarProducts();
  }

  void increaseOrDecreasePiece(int index, int piece) {
    if (cartProducts[index].piece != null) {
      cartProducts[index].piece = piece;
    }
    notifyListeners();
  }

  double? get totalPrice => cartProducts.isNotEmpty
      ? cartProducts
          .map((e) => e.price! * e.piece!)
          .reduce((value, element) => value + element)
      : 0;

  Future pay() async {
    showAlertDialog(
        title: 'Paid',
        content:
            'Your payment has been received. It will be delivered as soon as possible.',
        isShowOnlyConfirmButton: true);
    cartProducts = [];
    notifyListeners();
    await getSimilarProducts();
  }

  void navigateDetail(int i) {
    NavigationService.instance
        .navigateTo(AppRoute.detail, arg: similarProducts[i]);
  }
}
