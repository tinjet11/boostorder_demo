import 'package:flutter/foundation.dart';
import 'package:boostorder_demo/models/cart_model.dart';
import 'package:boostorder_demo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final CartModel _cart = CartModel();

  List<CartItem> get items => _cart.items;
  int get totalItems => _cart.totalItems;
  double get totalPrice => _cart.totalPrice;

  void addToCart(ProductModel product, int quantity) {
    _cart.addToCart(product, quantity);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cart.removeFromCart(product);
    notifyListeners();
  }

  void removeAllItemFromCart() {
    _cart.removeAllItemsFromCart();
    notifyListeners();
  }
}
