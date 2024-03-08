import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/product.dart';
import 'package:flutter_state_management/provider/controllers/favourite_controller.dart';
import 'package:provider/provider.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FavouriteController>(context, listen: false);

    return Card(
      child: ListTile(
        onTap: () {
          controller.removeFromFavourites(product);
        },
        autofocus: true,
        title: Text(product.name),
        trailing: IconButton(
          onPressed: () {
            controller.removeFromFavourites(product);
          },
          icon: Icon(
            Icons.minimize,
          ),
        ),
      ),
    );
  }
}
