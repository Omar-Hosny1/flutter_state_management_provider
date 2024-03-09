import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/product.dart';

class CartController extends ChangeNotifier {
  final List<Product> _cartItems = [];
  double _totalPrice = 0;

  UnmodifiableListView<Product> get cartItems {
    return UnmodifiableListView(_cartItems);
  }

  double get totalPrice {
    return _totalPrice;
  }

  addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      product.setInCart = true;
    }
    product.setQuantity = product.quantity + 1;
    _totalPrice += product.price;
    notifyListeners();
  }

  removeFromCart(Product product) {
    if (product.quantity == 1) {
      removeFromCartPermuntally(product);
      return;
    }
    product.setQuantity = product.quantity - 1;
    _totalPrice -= product.price;
    notifyListeners();
  }

  removeFromCartPermuntally(Product product) {
    _totalPrice -= product.quantity * product.price;
    product.resetCart();
    _cartItems.removeWhere((p) => p.id == product.id);
    notifyListeners();
  }

  void onCheckout() {
    _totalPrice = 0;
    for (var element in _cartItems) {
      element.resetCart();
    }
    _cartItems.clear();
    notifyListeners();
  }
}
