import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/views/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const screenName = '/cart';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: controller.cartItems.length > 0
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return CartItem(
                            product: controller.cartItems[index],
                          );
                        },
                        itemCount: controller.cartItems.length,
                      )
                    : Center(
                        child: Icon(
                        Icons.emoji_transportation,
                        size: 180,
                      )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
