import 'package:flutter/material.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final bool isSelectedCategory;
  final VoidCallback? onTap;

  const CategoryCard(
      {Key? key, required this.category, required this.isSelectedCategory, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelectedCategory
              ? Provider.of<FlavorConfig>(context, listen: false).appConstants?.grey
              : Provider.of<FlavorConfig>(context, listen: false).appConstants?.buttonColor,
        ),
        child: Text(
          category.substring(0, 1).toUpperCase() + category.substring(1),
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: !isSelectedCategory
                  ? Provider.of<FlavorConfig>(context, listen: false).appConstants?.grey
                  : Provider.of<FlavorConfig>(context, listen: false).appConstants?.buttonColor),
        ),
      ),
    );
  }
}
