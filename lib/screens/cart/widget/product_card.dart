import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/widgets/button/increase_decrease_button.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/cart/view_model/cart_view_model.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(int)? onChanged;

  const ProductCard({Key? key, required this.product, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appConstant =
        Provider.of<FlavorConfig>(context, listen: false).appConstants;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: product.image != null
                      ? DecorationImage(image: AssetImage(product.image!))
                      : null),
              child: product.image != null ? null : Lottie.asset(AppConstants().notFoundImages),
            ),
          ),
          Expanded(
            flex: 12,
            child: SizedBox(
              child: Text(
                product.product ?? '',
                style: GoogleFonts.quicksand(
                    color: appConstant!.buttonColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Text(
              '\$${product.price ?? ' '}',
              style: GoogleFonts.quicksand(
                  color: appConstant.buttonColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            flex: 6,
            child: IncreaseDecreaseButton(
              small: true,
              initialValue: product.piece,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
