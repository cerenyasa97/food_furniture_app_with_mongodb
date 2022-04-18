import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:food_furniture_app/core/base/base_view.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/home/view_model/home_view_model.dart';
import 'package:food_furniture_app/screens/home/widget/category_card.dart';
import 'package:food_furniture_app/screens/home/widget/popular_product_card.dart';
import 'package:food_furniture_app/screens/home/widget/product_by_category_card.dart';
import 'package:food_furniture_app/screens/shared/widget/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends BaseView<HomeViewModel> {
  const Home({Key? key}) : super(key: key);

  @override
  HomeViewModel get viewModel => HomeViewModel();

  @override
  Widget? body(BuildContext context, HomeViewModel viewModel) =>
      Consumer<FlavorConfig>(
        builder: (context, config, _) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductAppBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    config.appConstants?.homeDescription ?? '',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: config.appConstants?.buttonColor),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    itemBuilder: (context, index) => PopularProductCard(
                      onTap: () => viewModel.navigateToDetail(index,
                          isFromPopularProduct: true),
                      popularProduct: viewModel.popularProducts[index],
                    ),
                    itemCount: viewModel.popularProducts.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Categories',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: config.appConstants?.buttonColor)),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryCard(
                          category: viewModel.categories[index],
                          onTap: () => viewModel.changeCategory(index),
                          isSelectedCategory:
                              viewModel.selectedCategory == index),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: viewModel.categories.length),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: viewModel.productByCategory
                        .map((e) => ProductByCategoryCard(
                              onTap: () => viewModel.navigateToDetail(
                                  viewModel.productByCategory.indexOf(e)),
                              product: e,
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
