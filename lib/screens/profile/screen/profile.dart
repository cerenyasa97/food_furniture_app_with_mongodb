import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Provider.of<FlavorConfig>(context, listen: false)
        .appConstants
        ?.buttonColor;
    final style = GoogleFonts.quicksand(
        fontWeight: FontWeight.bold, fontSize: 20, color: textColor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: textColor,
          ),
          onPressed: () => NavigationService.instance.navigateBack(),
        ),
      ),
      backgroundColor:
          Provider.of<FlavorConfig>(context, listen: false).appConstants!.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 75),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Ionicons.person_outline,
                    size: 75,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 80),
                  child: Text(
                      '${MongoHelper.instance.user?.name ?? ''} ${MongoHelper.instance.user?.surname ?? ''}\n${MongoHelper.instance.user?.email ?? ''}',
                      style: style),
                ),
                menuRow('Siparişlerim', style, textColor),
                menuRow('Adreslerim', style, textColor),
                menuRow('Kuponlarım', style, textColor),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Ionicons.logo_facebook, size: 40,),
                    SizedBox(width: 50,),
                    Icon(Ionicons.logo_twitter, size: 40,),
                    SizedBox(width: 50,),
                    Icon(Ionicons.logo_instagram, size: 40,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding menuRow(String text, TextStyle style, Color? textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: style,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: textColor,
          )
        ],
      ),
    );
  }
}
