import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransparentTextFormField extends StatelessWidget {
  final String? label;
  final Color? textFieldBackgroundColor;
  final Color? textFieldTextColor;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final bool obscure;

  const TransparentTextFormField(
      {Key? key,
      this.label,
      this.textFieldBackgroundColor,
      this.textFieldTextColor,
      this.validator,
      this.obscure = false,
      this.onSaved})
      : super(key: key);

  get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  get errorOutlineInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      cursorColor: const Color(0xFF3A4F4F),
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        filled: true,
        fillColor: textFieldBackgroundColor != null
            ? textFieldBackgroundColor!.withOpacity(.6)
            : Color(0xFFEDE1D1).withOpacity(.6),
        labelStyle: GoogleFonts.quicksand(
          fontSize: 20,
          color: textFieldTextColor ?? Color(0xFFaf8552),
          fontWeight: FontWeight.bold,
        ),
        labelText: label,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: errorOutlineInputBorder,
        focusedErrorBorder: errorOutlineInputBorder,
        disabledBorder: outlineInputBorder,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
    );
  }
}
