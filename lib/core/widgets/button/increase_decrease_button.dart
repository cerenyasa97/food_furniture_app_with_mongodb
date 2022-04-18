import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncreaseDecreaseButton extends StatefulWidget {
  final Color? buttonColor;
  final int? initialValue;
  final Function(int)? onChanged;
  final bool small;

  const IncreaseDecreaseButton(
      {Key? key,
      this.buttonColor,
      this.initialValue,
      this.onChanged,
      this.small = false})
      : super(key: key);

  @override
  State<IncreaseDecreaseButton> createState() => _IncreaseDecreaseButtonState();
}

class _IncreaseDecreaseButtonState extends State<IncreaseDecreaseButton> {
  int count = 1;

  @override
  void initState() {
    if (widget.initialValue != null) count = widget.initialValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        increaseDecreaseButton(
            isIncrease: false,
            onTap: () {
              setState(() {
                if (count > 0) {
                  count -= 1;
                  if (widget.onChanged != null) widget.onChanged!(count);
                }
              });
            }),
        SizedBox(
          width: 8,
        ),
        Text(
          count.toString(),
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w500,
            fontSize: widget.small ? 28 : 36,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        increaseDecreaseButton(
            isIncrease: true,
            onTap: () {
              setState(() {
                count += 1;
                if (widget.onChanged != null) widget.onChanged!(count);
              });
            }),
      ],
    );
  }

  Widget increaseDecreaseButton({bool isIncrease = true, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.buttonColor ?? Colors.black,
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(4),
        child: Icon(
          isIncrease ? Icons.add : Icons.remove,
          size: widget.small ? 15 : null,
          color: Colors.white,
        ),
      ),
    );
  }
}
