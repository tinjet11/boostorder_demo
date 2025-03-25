import 'package:boostorder_demo/screens/cart.dart';
import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  List<int> quantities = [2, 3, 1, 3, 9];

  int get totalItems => quantities.fold(0, (sum, item) => sum + item); // Sum all items

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen(quantities)),
            );
          },
        ),
        if (totalItems > 0) // Only show the badge if there are items
          Positioned(
            right: 8,
            top: 2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red, // Badge color
                shape: BoxShape.circle, // Fully round shape
              ),
              constraints: const BoxConstraints(
                minWidth: 15,  // Ensures it is round
                minHeight: 15, // Ensures it is round
              ),
              child: Center(
                child: Text(
                  totalItems.toString(), // Display total count
                  style: const TextStyle(
                    color: Colors.white, // White text
                    fontSize: 10,
                   // fontWeight: FontWeightold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
