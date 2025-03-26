import 'package:boostorder_demo/models/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartModel {
  final List<CartItem> items = [];

  void addToCart(ProductModel product, int quantity) {
    var existingItem = items.firstWhere(
      (item) => item.product.variations[0].sku == product.variations[0].sku,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      items.add(CartItem(product: product, quantity: quantity));
    } else {
      existingItem.quantity += quantity;
    }
  }

  void removeFromCart(ProductModel product) {
    var existingItem = items.firstWhere(
      (item) => item.product.variations[0].sku == product.variations[0].sku,
    );

      items.remove(existingItem);
    
  }

  void removeAllItemsFromCart() {
    items.clear();
  }

  int get totalItems => items.fold(0, (total, item) => total + item.quantity);

  double get totalPrice => items.fold(
      0,
      (total, item) =>
          total + (double.parse(item.product.variations[0].regularPrice) * item.quantity));
}
