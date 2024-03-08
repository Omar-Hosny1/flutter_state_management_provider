import 'package:flutter_state_management/models/product.dart';

final List<Product> generatedProductsData = List.generate(
  15,
  (index) => Product(
    id: index.toString(),
    description: 'Description of $index',
    name: 'Name of $index',
    price: (index + 1) * 10,
  ),
);
