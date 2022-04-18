import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/widgets/button/custom_button.dart';
import 'package:food_furniture_app/core/widgets/button/increase_decrease_button.dart';
import 'package:food_furniture_app/core/widgets/rating/rating.dart';
import 'package:food_furniture_app/screens/product_detail/view_model/product_detail_view_model.dart';
import 'package:food_furniture_app/screens/product_detail/widget/similar_products.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBottomNavigationBar extends StatelessWidget {
  final ProductDetailViewModel viewModel;

  const DetailBottomNavigationBar({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final greenColor = AppConstants().buttonColor;
    return Container(
      height: 200,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SimilarProducts(viewModel: viewModel),
              IncreaseDecreaseButton(
                buttonColor: greenColor,
                onChanged: (piece) => viewModel.piece = piece,
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rating(rating: viewModel.product.rating ?? 0),
                Text(
                  '\$${viewModel.product.price}',
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                )
              ],
            ),
            CustomButton(
              isWidthExpand: true,
              text: 'Add Cart',
              onPressed: viewModel.addItemToCart,
            )
          ],
        ),
      ),
    );
    ;
  }
}
