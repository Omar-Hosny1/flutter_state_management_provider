import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/product.dart';

class FavouriteController extends ChangeNotifier {
  final List<Product> _favourites = [];

  List<Product> get favourites {
    return [..._favourites];
  }

  addToFavourites(Product product) {
    _favourites.add(product);
    product.setInFavourite = true;
    _updateFavouritesGetBuilders(product.id);
  }

  removeFromFavourites(Product product) {
    _favourites.removeWhere((p) => p.id == product.id);
    product.setInFavourite = false;
    _updateFavouritesGetBuilders(product.id);
  }

  _updateFavouritesGetBuilders(String id) {
    notifyListeners();
    // update([Strings.favouritesGetBuilderId, Strings.favItemGetBuilderId(id)]);
  }
}
