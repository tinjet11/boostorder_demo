import 'package:boostorder_demo/models/product_model.dart';
import 'package:boostorder_demo/providers/product_provider.dart';
import 'package:boostorder_demo/screens/components/product/product_cart_button.dart';
import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:boostorder_demo/screens/components/product/product_card.dart';
import 'package:boostorder_demo/screens/components/product/product_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String _searchQuery = ""; 

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // Filter products based on selected category & search query
    final List<ProductModel> filteredProducts = productProvider.products
        .where((product) =>
            product.categories.any((c) => c.name == widget.category) &&
            product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: widget.category),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: ProductSearchBar(
                  onSearch: (query) {
                    setState(() {
                      _searchQuery = query; // Update search query
                    });
                  },
                ),
              ),
              const CartButton(), // Stays at its normal size
            ],
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text("No product found"))
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: filteredProducts[index],
                      );
                    },
                  ),
          ),
        ]),
      ),
    );
  }
}
