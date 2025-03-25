import 'package:flutter/material.dart';

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
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Handle action here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
