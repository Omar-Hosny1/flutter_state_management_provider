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
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetails.screenName,
          arguments: product,
        );
      },
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(color: Colors.white),
                child: Image.network(
                  product.imageSrc,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                product.description,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(
                    0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.getFormatedPrice(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Consumer<CartController>(
                      builder: (context, controller, child) => InkWell(
                        child: Icon(
                          product.inCart
                              ? Icons.shopping_bag
                              : Icons.shopping_bag_outlined,
                          size: 23,
                        ),
                        onTap: () {
                          if (product.inCart) {
                            controller
                                .removeFromCartPermuntally(product);
                            return;
                          }
                          controller.addToCart(product);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: 50,
              child: Consumer<FavouriteController>(
                builder: (context, controller, child) => IconButton(
                  icon: Icon(
                    product.inFavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_outlined,
                    color: theme.primaryColor,
                  ),
                  onPressed: () {
                    if (product.inFavourite) {
                      controller.removeFromFavourites(product);
                      return;
                    }
                    controller.addToFavourites(product);
                  },
                ),
              ),
            ))
      ]),
    );

    // ListTile(
    //   onTap: () {
    //     Navigator.of(context).pushNamed(
    //       ProductDetails.screenName,
    //       arguments: product,
    //     );
    //   },
    //   style: ListTileStyle.list,
    //   leading: CircleAvatar(
    //     child: Text(product.id),
    //   ),
    //   title: Text(product.name),
    //   trailing: Container(
    //     width: 100,
    //     color: const Color.fromARGB(255, 210, 210, 210),
    //     child: Row(
    //       children: [
    //         SizedBox(
    //           width: 50,
    //           child: Consumer<CartController>(
    //             builder: (context, controller, child) => IconButton(
    //               icon: Icon(
    //                 product.inCart
    //                     ? Icons.shopping_bag
    //                     : Icons.shopping_bag_outlined,
    //               ),
    //               onPressed: () {
    //                 if (product.inCart) {
    //                   controller.removeFromCartPermuntally(product);
    //                   return;
    //                 }
    //                 controller.addToCart(product);
    //               },
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //             width: 50,
    //             child: Consumer<FavouriteController>(
    //               builder: (context, controller, child) => IconButton(
    //                 icon: Icon(
    //                   product.inFavourite
    //                       ? Icons.favorite
    //                       : Icons.favorite_outline_outlined,
    //                 ),
    //                 onPressed: () {
    //                   if (product.inFavourite) {
    //                     controller.removeFromFavourites(product);
    //                     return;
    //                   }
    //                   controller.addToFavourites(product);
    //                 },
    //               ),
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
