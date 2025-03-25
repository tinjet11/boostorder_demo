import 'package:flutter/material.dart';

class OrderTotalRow extends StatelessWidget {
  const OrderTotalRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Order Section
        Row(
          children: [
            Container(
              width: 2,
              height: 30,
              color: Colors.blue,
            ),
            const SizedBox(width: 5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      "1 UNIT",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Icon(Icons.chevron_right, size: 16),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "RM 100.00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
