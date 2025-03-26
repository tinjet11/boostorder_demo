class ProductModel {
  final int id;
  final String name;
  final List<Variation> variations;
  final List<Category> categories;
  final List<ProductImage> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.variations,
    required this.categories,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {

    List<Category> categories = (json["categories"] as List<dynamic>?)
            ?.map((cat) => Category.fromJson(cat))
            .toList() ??
        [];

    if (categories.isEmpty) {
      categories.add(Category(id: -1, name: "Uncategorized"));
    }

    List<Variation> variations = (json["variations"] as List<dynamic>?)
            ?.map((variation) => Variation.fromJson(variation))
            .toList() ??
        [];

    if (variations.isEmpty) {
      variations.add(Variation(
        sku: json["sku"] ?? "",
        regularPrice: json["regular_price"] ?? "0.00",
        inStock: json["in_stock"] ?? false,
        stockQuantity: json["stock_quantity"] ?? 0,
        uom: json["uom"] ?? "UNIT",
      ));
    }

    List<ProductImage> images = (json["images"] as List<dynamic>?)
            ?.map((img) => ProductImage.fromJson(img))
            .toList() ??
        [];

    return ProductModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "Unknown",
      variations: variations,
      categories: categories,
      images: images,
    );
  }

  ProductModel copyWith({
    String? name,
    List<Variation>? variations,
    List<Category>? categories,
    List<ProductImage>? images,
  }) {
    return ProductModel(
      id: id,
      name: name ?? this.name,
      variations: variations ?? this.variations,
      categories: categories ?? this.categories,
      images: images ?? this.images,
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? -1,
      name: json["name"] ?? "Uncategorized",
    );
  }
}

class Variation {
  final String sku;
  final String regularPrice;
  final bool inStock;
  final int stockQuantity;
  final String uom;

  Variation({
    required this.sku,
    required this.regularPrice,
    required this.inStock,
    required this.stockQuantity,
    required this.uom,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      sku: json["sku"] ?? "",
      regularPrice: json["regular_price"] ?? "0.00",
      inStock: json["in_stock"] ?? false,
      stockQuantity: json["stock_quantity"] ?? 0,
      uom: json["uom"] ?? "UNIT",
    );
  }
}

class ProductImage {
  final String srcSmall;
  final String srcMedium;
  final String srcLarge;

  ProductImage({
    required this.srcSmall,
    required this.srcMedium,
    required this.srcLarge,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      srcSmall: json["src_small"] ?? "",
      srcMedium: json["src_medium"] ?? "",
      srcLarge: json["src_large"] ?? "",
    );
  }
}
