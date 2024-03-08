import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/provider/controllers/favourite_controller.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/views/screens/product_details.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetails.screenName,
          arguments: product,
        );
      },
      style: ListTileStyle.list,
      leading: CircleAvatar(
        child: Text(product.id),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        color: const Color.fromARGB(255, 210, 210, 210),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Consumer<CartController>(
                builder: (context, controller, child) => IconButton(
                  icon: Icon(
                    product.inCart
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                  ),
                  onPressed: () {
                    if (product.inCart) {
                      controller.removeFromCartPermuntally(product);
                      return;
                    }
                    controller.addToCart(product);
                  },
                ),
              ),
            ),
            SizedBox(
                width: 50,
                child: Consumer<FavouriteController>(
                  builder: (context, controller, child) => IconButton(
                    icon: Icon(
                      product.inFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined,
                    ),
                    onPressed: () {
                      if (product.inFavourite) {
                        controller.removeFromFavourites(product);
                        return;
                      }
                      controller.addToFavourites(product);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
