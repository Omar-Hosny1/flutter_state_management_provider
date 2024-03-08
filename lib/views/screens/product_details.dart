import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/provider/controllers/favourite_controller.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  static const screenName = '/prod-details';

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Icon(
              Icons.production_quantity_limits,
              size: 200,
            )),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Consumer<CartController>(
                    builder: (context, controller, child) => ElevatedButton(
                      onPressed: () {
                        if (product.inCart) {
                          controller.removeFromCart(product);
                          return;
                        }
                        controller.addToCart(product);
                      },
                      child: Text(
                        product.inCart ? 'Remove From Cart' : 'Add to Cart',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Consumer<FavouriteController>(
                    builder: (context, controller, child) => ElevatedButton(
                      onPressed: () {
                        if (product.inFavourite) {
                          controller.removeFromFavourites(product);
                          return;
                        }
                        controller.addToFavourites(product);
                      },
                      child: product.inFavourite
                          ? Text('Remove From Favorites')
                          : Text('Add to Favorites'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
