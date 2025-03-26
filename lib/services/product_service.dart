import 'dart:convert';
import 'package:boostorder_demo/env/env.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static String baseUrl = Env.baseUrl;
  static String username = Env.username;
  static String password = Env.password;

  final Box<String> productBox = Hive.box<String>('products_json');

  Future<List<ProductModel>> fetchAllProducts() async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    try {
      final firstResponse = await http.get(
        Uri.parse("$baseUrl?page=1"),
        headers: {"Authorization": basicAuth},
      );

      if (firstResponse.statusCode != 200) throw Exception("API request failed");

      int totalPages =
          int.tryParse(firstResponse.headers['x-wp-totalpages'] ?? '1') ?? 1;

      List<dynamic> allProducts = jsonDecode(firstResponse.body)["products"];

      for (int page = 2; page <= totalPages; page++) {
        final response = await http.get(
          Uri.parse("$baseUrl?page=$page"),
          headers: {"Authorization": basicAuth},
        );

        if (response.statusCode == 200) {
          allProducts.addAll(jsonDecode(response.body)["products"]);
        } else {
          throw Exception("Failed to load products from page $page");
        }
      }

      String jsonString = jsonEncode({"products": allProducts});
      productBox.put('products', jsonString);

      return _processProducts(jsonDecode(jsonString));
    } catch (e) {
      if (productBox.containsKey('products')) {
        String jsonString = productBox.get('products')!;
        return _processProducts(jsonDecode(jsonString));
      }
      return [];
    }
  }

  List<ProductModel> _processProducts(Map<String, dynamic> jsonData) {
    List<ProductModel> productList = [];

    if (jsonData.containsKey("products") && jsonData["products"] is List) {
      for (var productJson in jsonData["products"]) {
        List<Category> categories =
            (productJson["categories"] as List<dynamic>?)
                    ?.map((cat) => Category.fromJson(cat))
                    .toList() ??
                [];

        if (categories.isEmpty) {
          categories.add(Category(id: -1, name: "Uncategorized"));
        }

        ProductModel baseProduct = ProductModel.fromJson(productJson);
        productList.add(baseProduct);
      }
    }

    return productList;
  }
}
 