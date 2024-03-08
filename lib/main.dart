import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/provider/controllers/favourite_controller.dart';
import 'package:flutter_state_management/provider/controllers/product_controller.dart';
import 'package:flutter_state_management/provider/routes.dart';
import 'package:flutter_state_management/views/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: Home.screenName,
      ),
    );
    // ChangeNotifierProvider(
    //   create: (context) => ProductController(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     routes: routes,
    //     initialRoute: Home.screenName,
    //   ),
    // );
  }
}
