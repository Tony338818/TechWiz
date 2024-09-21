class Product {
  final String productName;
  final String imageUrl;
  final String description;
  final String price;
  final double rating;
  final String galleryId;
  final List<String> relatedProductIds;
  final String brand;
  final bool hasDiscount;  // New field to check if discount exists
  final String? slashedPrice;  // Original price if discount exists

  Product({
    required this.productName,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.rating,
    required this.galleryId,
    required this.relatedProductIds,
    required this.brand,
    this.hasDiscount = false,  // Default to no discount
    this.slashedPrice,  // Optional field for original price
  });


// Factory method to parse from JSON (Firestore document)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imageUrl: json['imageUrl'] ?? '',
      productName: json['name'] ?? '',  // Adjusted key to match "name" in your structure
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      galleryId: json['galleryId'] ?? '',  // Parse gallery ID
      relatedProductIds: List<String>.from(json['relatedProductIds'] ?? []),
      brand: json['brand'] ?? '',  // Parse related product IDs
      hasDiscount: json['hasDiscount'] ?? '',
      slashedPrice: json['slashedPrice'] ?? '',

    );
  }

  // Method to convert the Product object back to JSON (Firestore document)
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': productName,  // Adjusted key to "name"
      'description': description,  // Added description field
      'price': price,
      'rating': rating,
      'galleryId': galleryId,  // Added galleryId field
      'relatedProductIds': relatedProductIds,  // Added relatedProductIds field
      'brand': brand,
      'hasDiscount':hasDiscount,
      'slashedPrice':slashedPrice,
    };
  }
}
