import 'package:boostorder_demo/screens/category.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const ProductCategoryList(),
    );
  }
}
