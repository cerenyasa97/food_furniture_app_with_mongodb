import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/base/base_view.dart';
import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/widgets/button/custom_button.dart';
import 'package:food_furniture_app/core/widgets/dialog/alert_dialog.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/cart/view_model/cart_view_model.dart';
import 'package:food_furniture_app/screens/cart/widget/product_card.dart';
import 'package:food_furniture_app/screens/home/widget/product_by_category_card.dart';
import 'package:food_furniture_app/screens/shared/widget/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appConstant =
        Provider
            .of<FlavorConfig>(context, listen: false)
            .appConstants;
    return Consumer<CartViewModel>(
      builder: (context, viewModel, _) =>
          Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                children: [
                  const ProductAppBar(isCartVisible: false),
                  const SizedBox(
                    height: 30,
                  ),
                  if(viewModel.cartProducts.isNotEmpty)
                    ...[
                      Text(
                      'Cart',
                      style: GoogleFonts.quicksand(
                          color: appConstant!.buttonColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            ProductCard(
                              product: viewModel.cartProducts[index],
                              onChanged: (piece) =>
                                  viewModel.increaseOrDecreasePiece(
                                      index, piece),
                            ),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 10,
                        ),
                        itemCount: viewModel.cartProducts.length,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(flex: 3, child: const SizedBox()),
                            Flexible(
                              flex: 2,
                              child: Text(
                                'Total',
                                style: GoogleFonts.quicksand(
                                    color: appConstant.buttonColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                '\$${viewModel.totalPrice?.toStringAsFixed(2) ??
                                    ' '}',
                                style: GoogleFonts.quicksand(
                                    color: appConstant.buttonColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      CustomButton(
                        text: 'PAY',
                        isWidthExpand: true,
                        onPressed: viewModel.pay,
                      ),
                    ],
                  Text(
                    viewModel.cartProducts.isNotEmpty ? 'Similar Products' : 'Add Product To Cart',
                    style: GoogleFonts.quicksand(
                        color: appConstant!.buttonColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 225,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ProductByCategoryCard(
                                product: viewModel.similarProducts[index],
                                onTap: () => viewModel.navigateDetail(index),
                              ),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 10,
                          ),
                          itemCount: viewModel.similarProducts.length),
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
