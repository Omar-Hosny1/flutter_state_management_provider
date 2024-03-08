import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/controllers/favourite_controller.dart';
import 'package:flutter_state_management/views/widgets/favourite_item.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});
  static const screenName = '/favourite';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FavouriteController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favourites'),
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
                child: controller.favourites.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return FavouriteItem(
                            product: controller.favourites[index],
                          );
                        },
                        itemCount: controller.favourites.length,
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
