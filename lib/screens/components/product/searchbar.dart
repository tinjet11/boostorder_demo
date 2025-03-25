import 'package:flutter/material.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Reduced vertical padding
      child: SizedBox(
        height: 36, // Adjusted height
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, size: 18), // Smaller icon
            filled: true,
            fillColor: Colors.white10,
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Reduced padding
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Smaller radius
            ),
          ),
          style: const TextStyle(fontSize: 14), // Adjusted text size
          onChanged: (value) {
            print("Search query: $value");
          },
        ),
      ),
    );
  }
}
