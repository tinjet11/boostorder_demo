import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:boostorder_demo/screens/product.dart';
import 'package:flutter/material.dart';

class ProductCategoryList extends StatefulWidget {
  const ProductCategoryList({super.key});

  @override
  State<ProductCategoryList> createState() => _ProductCategoryListState();
}

class _ProductCategoryListState extends State<ProductCategoryList> {
  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Electronics",
      "Fashion",
      "Home & Kitchen",
      "Beauty & Health",
      "Sports & Outdoors",
      "Automotive"
    ];

    return Scaffold(
        appBar: const CustomAppBar(title: "Product List"),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.category, color: Colors.blue),
              title: Text(categories[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        category: categories[index],
                      ),
                    ));
              },
            );
          },
        ));
  }
}
