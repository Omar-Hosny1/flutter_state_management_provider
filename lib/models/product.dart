class Product {
  late String _id;
  late String _name;
  late String _description;
  late double _price;
  late bool _inCart; // for the product item cart icon
  late bool _inFavourite; // for the product item favourite icon
  late int _quantity;

  Product({
    required String id,
    required String description,
    required String name,
    required double price,
    bool inCart = false,
    bool inFavourite = false,
    int quantity = 0,
  }) {
    _id = id;
    _description = description;
    _name = name;
    _inCart = inCart;
    _inFavourite = inFavourite;
    _price = price;
    _quantity = quantity;
  }

  String get id {
    return _id;
  }

  int get quantity {
    return _quantity;
  }

  String get description {
    return _description;
  }

  String get name {
    return _name;
  }

  bool get inCart {
    return _inCart;
  }

  bool get inFavourite {
    return _inFavourite;
  }

  double get price {
    return _price;
  }

  set setPrice(double price) {
    _price = price;
  }

  set setId(String val) {
    _id = val;
  }

  set setDescription(String val) {
    _description = val;
  }

  set setName(String val) {
    _name = val;
  }

  set setInCart(bool val) {
    _inCart = val;
  }

  set setInFavourite(bool val) {
    _inFavourite = val;
  }

  set setQuantity(int val) {
    _quantity = val;
  }

  resetCart() {
    _inCart = false;
    _quantity = 0;
  }
}
