import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/route/route.dart';
import 'package:food_furniture_app/screens/cart/view_model/cart_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ProductAppBar extends StatelessWidget {
  final bool isCartVisible;

  const ProductAppBar({Key? key, this.isCartVisible = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<FlavorConfig>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isCartVisible
            ? circularContainer(Ionicons.cart,
                () => NavigationService.instance.navigateTo(AppRoute.cart))
            : circularContainer(
          Icons.arrow_back_ios,
              () => NavigationService.instance.navigateBack(),
        ),
        Text(
          config.appTitle,
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: config.appConstants?.buttonColor),
        ),
        circularContainer(Ionicons.person_outline,
            () => NavigationService.instance.navigateTo(AppRoute.profile)),
      ],
    );
  }

  Widget circularContainer(IconData icon, VoidCallback onTap) {
    return Consumer<CartViewModel>(
        builder: (context, cartModel, _) => Stack(
              children: [
                InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppConstants().grey, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(15),
                    child: Icon(icon),
                  ),
                ),
                Visibility(
                  visible: icon == Ionicons.cart &&
                      cartModel.cartProducts.isNotEmpty,
                  child: Positioned(
                    right: 0,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        padding: const EdgeInsets.all(8),
                        child: Text(cartModel.cartProducts.length.toString())),
                  ),
                )
              ],
            ));
  }
}
