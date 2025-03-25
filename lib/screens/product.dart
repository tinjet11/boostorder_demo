import 'package:boostorder_demo/screens/components/cart/cart_button.dart';
import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:boostorder_demo/screens/components/product/product_card.dart';
import 'package:boostorder_demo/screens/components/product/searchbar.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<int> quantities = [1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.category),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Row(
            children: [
              Expanded(
                child: ProductSearchBar(), // Takes up available space
              ),
              CartButton(), // Stays at its normal size
            ],
          ),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ProductCard();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
