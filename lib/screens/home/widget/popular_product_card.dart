import 'package:flutter/material.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PopularProductCard extends StatelessWidget {
  final Product popularProduct;
  final VoidCallback? onTap;

  const PopularProductCard({Key? key, required this.popularProduct, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Card(
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Provider.of<FlavorConfig>(context, listen: false)
                        .appConstants
                        ?.grey,
                    image: popularProduct.image != null
                        ? DecorationImage(
                        image: AssetImage(popularProduct.image!),
                        fit: BoxFit.fill)
                        : null),
                child: popularProduct.image != null
                    ? null
                    : Lottie.asset(
                    Provider.of<FlavorConfig>(context, listen: false)
                        .appConstants!
                        .notFoundImages),
              ),
              SizedBox(
                width: 225,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularProduct.brand ?? '',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color:
                          Provider.of<FlavorConfig>(context, listen: false)
                              .appConstants
                              ?.buttonColor),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      popularProduct.product ?? '',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color:
                          Provider.of<FlavorConfig>(context, listen: false)
                              .appConstants
                              ?.buttonColor),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Ionicons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text((popularProduct.rating ?? 4.3).toString(),
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Provider.of<FlavorConfig>(context,
                                        listen: false)
                                        .appConstants
                                        ?.buttonColor)),
                          ],
                        ),
                        Text('\$${popularProduct.price ?? ''}',
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Provider.of<FlavorConfig>(context,
                                    listen: false)
                                    .appConstants
                                    ?.buttonColor)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Provider.of<FlavorConfig>(context, listen: false).appConstants?.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ),
  );
}
