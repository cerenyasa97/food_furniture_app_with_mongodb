import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/contants/app_constants.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/core/widgets/button/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

void showAlertDialog(
    {String? title,
    String? content,
    String? confirmButtonText,
    VoidCallback? onTap,
    BuildContext? context,
    bool isShowOnlyConfirmButton = false}) {
  // flutter defined function
  context ??= NavigationService.instance.navigatorKey.currentContext!;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(
          title ?? "Alert Dialog title",
          style: GoogleFonts.quicksand(
              color: AppConstants.instance.buttonColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          content ?? "Alert Dialog body",
          style: GoogleFonts.quicksand(
              color: AppConstants.instance.buttonColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          Visibility(
            visible: !isShowOnlyConfirmButton,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: CustomButton(
                text: "Cancel",
                onPressed: () {
                  NavigationService.instance.navigateBack(arg: false);
                },
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: CustomButton(
              text: confirmButtonText ?? "OK",
              onPressed: () {
                NavigationService.instance.navigateBack(arg: true);
                if (onTap != null) onTap();
              },
            ),
          ),
        ],
      );
    },
  );
}
