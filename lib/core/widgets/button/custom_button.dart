import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final bool isWidthExpand;

  const CustomButton(
      {Key? key, this.onPressed, this.text, this.isWidthExpand = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text ?? 'OK',
          style: GoogleFonts.quicksand(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => const Color(0xFF3A4F4F),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isWidthExpand ? 10 : 5),))),
    );
    return isWidthExpand
        ? SizedBox(width: double.maxFinite, height: 60, child: button)
        : button;
  }
}
