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


    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.network(
            product.imageSrc,
            height: 120,
            width: 120,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                product.description,
                style: const TextStyle(fontSize: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.getFormatedPrice(),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        )),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => controller.removeFromCart(product),
                        ),
                        Text(
                          product.quantity.toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => controller.addToCart(product),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );

    // Container(
    //   padding: EdgeInsets.all(5),
    //   decoration: BoxDecoration(
    //     border: Border(
    //       bottom: BorderSide(
    //         color: Color.fromARGB(255, 185, 185, 185),
    //         width: .5,
    //       ),
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       Image.network(
    //         imageSrc,
    //         width: 120.0,
    //         height: 120.0,
    //       ),
    //       const SizedBox(width: 15.0),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               product.name,
    //               style: const TextStyle(fontSize: 18.0),
    //             ),
    //             Text(
    //               product.description,
    //               style: const TextStyle(fontSize: 16.0),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   product.getFormatedPrice(),
    //                   style: const TextStyle(fontSize: 18.0),
    //                 ),
    //                 Spacer(),
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(30),
    //                     border: Border.all(
    //                       width: 1,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       IconButton(
    //                         icon: const Icon(Icons.remove),
    //                         onPressed: () => controller.removeFromCart(product),
    //                       ),
    //                       Text(
    //                         product.quantity.toString(),
    //                         style: const TextStyle(fontSize: 16.0),
    //                       ),
    //                       IconButton(
    //                         icon: const Icon(Icons.add),
    //                         onPressed: () => controller.addToCart(product),

    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
