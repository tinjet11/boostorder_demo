import 'package:boostorder_demo/screens/components/cart/cart_total_row.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.blueGrey, width: 0.5), // Bottom border only
        ),
      ),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Details
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "SKU_12345  ",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "100 In stock",
                          style: TextStyle(color: Colors.green, fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      'Product Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'RM 100.00',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Product Image
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Light grey background
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.image, // Placeholder icon
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const OrderTotalRow(),
          ],
        ),
      ),
    );
  }
}
