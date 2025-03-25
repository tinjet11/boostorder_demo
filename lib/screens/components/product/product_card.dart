import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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

            // Quantity Selector Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Dropdown for Unit
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 40,
                  child: DropdownButton<String>(
                    value: 'UNIT',
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: 'UNIT',
                        child: Text("UNIT"),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                // Quantity Selector
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: () {},
                      ),
                      const Text(
                        "1",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),

                // Add Button
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 18,
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
