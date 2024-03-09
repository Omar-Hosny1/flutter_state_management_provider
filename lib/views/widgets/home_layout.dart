import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/product_controller.dart';
import 'package:flutter_state_management/views/widgets/product_item.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 2.8 / 4,
              ),
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
    );
  }
}
