import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/views/screens/cart.dart';
import 'package:flutter_state_management/views/screens/favourites.dart';
import 'package:flutter_state_management/views/screens/home.dart';
import 'package:flutter_state_management/views/screens/product_details.dart';

final routes = {
  Home.screenName: (BuildContext context) => Home(),
  Cart.screenName: (BuildContext context) => Cart(),
  Favourites.screenName: (BuildContext context) => Favourites(),
  ProductDetails.screenName: (BuildContext context) => ProductDetails(),
};
