import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/product_controller.dart';
import 'package:flutter_state_management/views/screens/cart.dart';
import 'package:flutter_state_management/views/screens/favourites.dart';
import 'package:flutter_state_management/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const screenName = '/home';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello App'),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Cart'),
                  value: 'Cart',
                ),
                PopupMenuItem(
                  child: Text('Favourite'),
                  value: 'Favourite',
                ),
              ];
            },
            onSelected: (val) {
              if (val == 'Cart') {
                Navigator.of(context).pushNamed(Cart.screenName);
                return;
              }
              Navigator.of(context).pushNamed(Favourites.screenName);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, i) {
                  return ProductItem(
                    product: controller.products[i],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
