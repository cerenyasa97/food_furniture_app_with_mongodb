import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rating extends StatelessWidget {
  final double rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(var i = 0; i < 5; i++)
          Icon(
            i < rating.round()
                ? Icons.star
                : Icons.star_border,
            color: Colors.amber,
          ),
        const SizedBox(
          width: 10,
        ),
        Text(
          rating.toString(),
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.amber),
        )
      ],
    );
  }
}
