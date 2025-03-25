import 'package:boostorder_demo/screens/components/cart/cart_product_card.dart';
import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<int> quantities;
  const CartScreen(this.quantities, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Cart"),
      body: Column(
        children: [
          // Scrollable product list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: quantities.length,
              itemBuilder: (context, index) {
                return const CartProductCard();
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
                    const Text(
                      'Total (3): ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'RM ${(quantities.reduce((a, b) => a + b)) * 100}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
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
