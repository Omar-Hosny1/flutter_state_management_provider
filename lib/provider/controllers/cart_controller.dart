import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/product.dart';

class CartController extends ChangeNotifier {
  final List<Product> _cartItems = [];

  UnmodifiableListView<Product> get cartItems {
    return UnmodifiableListView(_cartItems);
  }

  addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      product.setInCart = true;
    }
    product.setQuantity = product.quantity + 1;
    notifyListeners();
  }

  removeFromCart(Product product) {
    if (product.quantity == 1) {
      removeFromCartPermuntally(product);
      return;
    }
    product.setQuantity = product.quantity - 1;
    notifyListeners();
  }

  removeFromCartPermuntally(Product product) {
    product.resetCart();
    _cartItems.removeWhere((p) => p.id == product.id);
    notifyListeners();
  }
}
