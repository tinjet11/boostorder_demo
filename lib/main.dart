import 'package:boostorder_demo/providers/cart_provider.dart';
import 'package:boostorder_demo/providers/product_provider.dart';
import 'package:boostorder_demo/screens/category.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('products_json');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets the main theme color
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue), // Better for Material 3
        useMaterial3: true, // Enables Material 3 theming
      ),
      home: const CategoryList(),
    );
  }
}
