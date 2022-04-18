import 'package:flutter/material.dart';
import 'package:food_furniture_app/screens/product_detail/view_model/product_detail_view_model.dart';
import 'package:food_furniture_app/util/dummy_data/model/food.dart';
import 'package:food_furniture_app/util/dummy_data/model/furniture.dart';

class SimilarProducts extends StatelessWidget {
  final ProductDetailViewModel viewModel;

  const SimilarProducts({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          viewModel.product is Furniture
              ? (viewModel.product as Furniture).colorOptions!.length
              : viewModel.similarProducts.length,
              (index) => InkWell(
            onTap: () async {
              if (viewModel.product is Furniture) {
                await viewModel.getFurnitureByColor(
                    (viewModel.product as Furniture)
                        .colorOptions![index]);
              } else {
                viewModel.getFoodByType(index);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: viewModel.product is Furniture ? 35 : 50,
              height: viewModel.product is Furniture ? 35 : 50,
              decoration: BoxDecoration(
                  color: viewModel.product is Furniture
                      ? viewModel.getColorByString(
                      (viewModel.product as Furniture)
                          .colorOptions![index])
                      : null,
                  shape: viewModel.product is Furniture
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  borderRadius: viewModel.product is Food
                      ? BorderRadius.circular(8)
                      : null,
                  border: Border.all(color: Colors.grey.shade300),
                  image: viewModel.product is Food &&
                      viewModel.product.image != null
                      ? DecorationImage(
                      image: AssetImage(viewModel
                          .similarProducts[index].image!))
                      : null),
            ),
          )),
    );
  }
}
