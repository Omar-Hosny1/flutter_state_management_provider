import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/product.dart';


class ProductController extends ChangeNotifier {
  List<Product> products = [];

  ProductController() {
    log('ProductController INIT');
    products = List.generate(
      15,
      (index) => Product(
        id: (index + 1).toString(),
        description: 'Description of ${index + 1}',
        name: 'Name of ${index + 1}',
        price: (index + 1) * 10,
      ),
    );
    notifyListeners();
  }
}
