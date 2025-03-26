import 'package:boostorder_demo/models/cart_model.dart';

import 'package:flutter/material.dart';

class CartProductSummary extends StatelessWidget {
  final CartItem item;
  const CartProductSummary({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              width: 2,
              height: 30,
              color: Colors.blue,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      "${item.quantity} ${item.product.variations[0].uom} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Icon(Icons.chevron_right, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 5),
        // Total Section
        Row(
          children: [
            Container(
              width: 2,
              height: 30,
              color: Colors.amber,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "RM ${(double.parse(item.product.variations[0].regularPrice) * item.quantity).toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
