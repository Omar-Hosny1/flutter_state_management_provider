import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/product.dart';


class ProductController extends ChangeNotifier {
  List<Product> products = [];

  ProductController() {
    products = List.generate(
      15,
      (index) => Product(
        id: (index + 1).toString(),
        name: 'Name of Product Number ${index + 1}',
        description: 'Description of ${index + 1}',
        price: (index + 1) * 1000,
      ),
    );
    notifyListeners();
  }
}
