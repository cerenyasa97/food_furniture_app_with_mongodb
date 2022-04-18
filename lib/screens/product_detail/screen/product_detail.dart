import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/base/base_view.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/product_detail/view_model/product_detail_view_model.dart';
import 'package:food_furniture_app/screens/product_detail/widget/detail_bottom_navigation_bar.dart';
import 'package:food_furniture_app/screens/product_detail/widget/product_detail_card.dart';
import 'package:food_furniture_app/util/dummy_data/model/product.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductDetail extends BaseView<ProductDetailViewModel> {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  ProductDetailViewModel get viewModel => ProductDetailViewModel(product);

  @override
  Widget? body(BuildContext context, ProductDetailViewModel viewModel) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final appConstants =
        Provider.of<FlavorConfig>(context, listen: false).appConstants!;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              left: -10,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1/2,
                child: viewModel.product.image != null
                    ? Image.asset(
                        viewModel.product.image!,
                        fit: BoxFit.cover,
                      )
                    : Lottie.asset(appConstants.notFoundImages),
              ),
            ),
            Positioned(
              bottom: -200,
              child: ProductDetailCard(product: product,),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar(ProductDetailViewModel viewModel) {
    return DetailBottomNavigationBar(viewModel: viewModel);
  }

  @override
  Color? get backgroundColor => const Color(0xFFFCFCFC);
}
