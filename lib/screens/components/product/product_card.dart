import 'package:boostorder_demo/models/product_model.dart';
import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:boostorder_demo/screens/components/product/product_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1; // Track selected quantity
  late Variation selectedVariation; // Store selected variation

  @override
  void initState() {
    super.initState();
    selectedVariation = widget.product.variations.isNotEmpty
        ? widget.product.variations.first
        : Variation(
            sku: "",
            regularPrice: "0.00",
            inStock: false,
            stockQuantity: 0,
            uom: "UNIT",
          );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blueGrey, width: 0.5),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "SKU_${selectedVariation.sku}",
                          style: const TextStyle(fontSize: 10),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${selectedVariation.stockQuantity} In stock",
                          style: TextStyle(
                            color: selectedVariation.inStock
                                ? Colors.green
                                : Colors.red,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'RM ${double.parse(selectedVariation.regularPrice).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ProductImageContainer(
                  product: widget.product,
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Dropdown for Variation Selection
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  height: 40,
                  child: DropdownButton<String>(
                    value: selectedVariation.uom,
                    underline: const SizedBox(),
                    items: widget.product.variations.map((variation) {
                      return DropdownMenuItem(
                        value: variation.uom,
                        child: Text(variation.uom),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedVariation = widget.product.variations
                            .firstWhere((variation) => variation.uom == value);
                      });
                    },
                  ),
                ),

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
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 18,
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    onPressed: () {
                      cartProvider.addToCart(
                          widget.product.copyWith(
                            variations: [selectedVariation],
                          ),
                          quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 50),
                            content: Text('Added to cart!')),
                      );
                    },
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
