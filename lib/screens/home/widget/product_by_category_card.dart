import 'package:flutter/material.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductByCategoryCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductByCategoryCard({Key? key, required this.product, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Provider.of<FlavorConfig>(context, listen: false)
                          .appConstants
                          ?.grey,
                      image: product.image != null
                          ? DecorationImage(image: AssetImage(product.image!))
                          : null),
                  child: product.image == null
                      ? Lottie.asset(
                          Provider.of<FlavorConfig>(context, listen: false)
                              .appConstants!
                              .notFoundImages)
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(product.product ?? '',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Provider.of<FlavorConfig>(context, listen: false)
                              .appConstants
                              ?.buttonColor)),
                ),
                Text('\$${product.price ?? ' '}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Provider.of<FlavorConfig>(context, listen: false)
                            .appConstants
                            ?.buttonColor))
              ],
            ),
          ),
        ),
  );
}
