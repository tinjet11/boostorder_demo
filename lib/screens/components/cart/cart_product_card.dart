import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:boostorder_demo/screens/components/product/product_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boostorder_demo/models/cart_model.dart';

import 'package:boostorder_demo/screens/components/cart/cart_product_summary.dart';

class CartProductCard extends StatelessWidget {
  final CartItem item;
  final int index;

  const CartProductCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Dismissible(
      key: Key(item.product.variations[0].sku),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Remove Item"),
              content: const Text(
                  "Are you sure you want to remove this item from your cart?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child:
                      const Text("Delete", style: TextStyle(color: Colors.red)),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        cartProvider.removeFromCart(item.product);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${item.product.name} removed from cart"),
            duration: const Duration(milliseconds: 50),
          ),
        );
      },
      child: Container(
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
                            index.toString(),
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${item.product.variations[0].sku}  •  ',
                            style: const TextStyle(fontSize: 10),
                          ),
                          Text(
                            "${item.product.variations[0].stockQuantity} In stock",
                            style: const TextStyle(
                                color: Colors.green, fontSize: 10),
                          ),
                        ],
                      ),
                      Text(
                        item.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'RM ${double.parse(item.product.variations[0].regularPrice).toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  ProductImageContainer(
                    product: item.product,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CartProductSummary(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
