import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CartController>(context);

    return ListTile(
      title: Text(product.name),
      trailing: Container(
        width: 110,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                controller.addToCart(product);
              },
              icon: Icon(
                Icons.text_increase,
              ),
            ),
            Text(product.quantity.toString()),
            IconButton(
              onPressed: () {
                controller.removeFromCart(product);
              },
              icon: Icon(
                Icons.text_decrease,
              ),
            )
          ],
        ),
      ),
    );
  }
}
