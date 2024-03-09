import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/cart_controller.dart';
import 'package:flutter_state_management/views/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CartController>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                width: 0.3,
                color: Color.fromARGB(255, 132, 132, 132),
              ),
            )),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(fontSize: 25),
                ),
                Spacer(),
                Text(
                  "\$ ${controller.totalPrice} USD",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ],
            ),
            Text(
              'This is a dummy data so keep it fake bla bla',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 43, 43, 43)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  controller.onCheckout();
                },
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
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
                          Icons.add_circle_outline_outlined,
                          size: 150,
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
