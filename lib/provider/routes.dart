import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/views/screens/home.dart';
import 'package:flutter_state_management/views/screens/product_details.dart';

final routes = {
  Home.screenName: (BuildContext context) => Home(),
  ProductDetails.screenName: (BuildContext context) => ProductDetails(),
};
