import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:boostorder_demo/screens/components/cart/cart_product_card.dart';
import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: const CustomAppBar(title: "Cart"),
      body: Column(
        children: [
          // Scrollable product list
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cartItems.length + 1,
                    itemBuilder: (context, index) {
                      if (index < cartItems.length) {
                        final item = cartItems[index];
                        return CartProductCard(item: item, index: index + 1);
                      } else {
                        // Display total price row at the end
                        return Container(
                          
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'RM ${cartProvider.totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );                }
                    },
                    
                  ),
          ),

          // Fixed total & checkout section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total (${cartItems.length}): ',
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      'RM ${cartProvider.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: cartItems.isNotEmpty ? () {} : null,
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
