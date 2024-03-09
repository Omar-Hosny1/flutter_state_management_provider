import 'package:flutter_state_management/views/widgets/cart_layout.dart';
import 'package:flutter_state_management/views/widgets/favourite_layout.dart';
import 'package:flutter_state_management/views/widgets/home_layout.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const screenName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Shopping App'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                SizedBox(
                  width: double.infinity,
                  child: Tab(
                    icon: Icon(Icons.home_outlined),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(
                    icon: Icon(Icons.shopping_basket_outlined),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
              children: [HomeLayout(), CartLayout(), FavouriteLayout()])),
    );
  }
}
