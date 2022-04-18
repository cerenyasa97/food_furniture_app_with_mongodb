import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/helper/mongo_helper.dart';
import 'package:food_furniture_app/core/navigation/navigation.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/route/route.dart';
import 'package:food_furniture_app/screens/cart/view_model/cart_view_model.dart';
import 'package:provider/provider.dart';

void mainCommon(FlavorConfig config) {
  MongoHelper.instance;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<FlavorConfig>(
        create: (_) => config,
      ),
      ChangeNotifierProvider<CartViewModel>(
        create: (_) => CartViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.login,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
