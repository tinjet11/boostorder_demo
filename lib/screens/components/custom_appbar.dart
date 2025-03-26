import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white, size: 16.0),
      titleTextStyle: const TextStyle(color: Colors.white),
      toolbarTextStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.blue,
      title: Text(title),
      actions: [
        const Text("Company Name"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // White background
          ),
          child: const Text(
            "CN",
            style: TextStyle(
              color: Colors.blue, // Blue text
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'clear_cart') {
              Provider.of<CartProvider>(context, listen: false)
                  .removeAllItemFromCart();
            }
          },
          itemBuilder: (context) => [
            if (title == "Cart")
              const PopupMenuItem<String>(
                value: 'clear_cart',
                child: Text("Clear Cart"),
              ),
          ],
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
