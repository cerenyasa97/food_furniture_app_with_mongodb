import 'package:flutter/material.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailCard extends StatelessWidget {
  final Product product;

  const ProductDetailCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final appConstants =
        Provider.of<FlavorConfig>(context, listen: false).appConstants!;
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Container(
        width: width,
        height: height *  5/12,
        padding: const EdgeInsets.all(16),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            RichText(
              text: TextSpan(
                  text: product.brand,
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: appConstants.buttonColor),
                  children: [
                    TextSpan(
                      text: ' ${product.product}',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          color: appConstants.buttonColor),
                    )
                  ]),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              product.description ?? '',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: appConstants.buttonColor),
            )
          ],
        ),
      ),
    );
  }
}
