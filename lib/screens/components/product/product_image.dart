import 'package:boostorder_demo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductImageContainer extends StatelessWidget {
  final ProductModel product;
  const ProductImageContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: product.images.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.images[0].srcSmall,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image,
                    color: Colors.grey,
                    size: 24,
                  );
                },
              ),
            )
          : const Icon(
              Icons.image,
              color: Colors.grey,
              size: 24,
            ),
    );
  }
}
