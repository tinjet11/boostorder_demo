import 'package:boostorder_demo/providers/product_provider.dart';
import 'package:boostorder_demo/screens/components/custom_appbar.dart';
import 'package:boostorder_demo/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Product Categories"),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (productProvider.products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          // Extract unique categories from products
          final List<String> categories = productProvider.products
              .expand((product) => product.categories.map((c) => c.name))
              .toSet()
              .toList();

          return ListView.builder(
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
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
