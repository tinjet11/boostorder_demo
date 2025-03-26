import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:boostorder_demo/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
        ),
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
              minWidth: 15,
              minHeight: 15,
            ),
            child: Center(
              child: Text(
                cartProvider.items.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
