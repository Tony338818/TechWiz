class GalleryModel {
  String id;
  String title;
  String roomType;
  String style;
  String category;
  double price;
  List<String> images;

  GalleryModel(
      {required this.id,
      required this.title,
      required this.roomType,
      required this.style,
      required this.category,
      required this.price,
      required this.images});

  factory GalleryModel.fromJson(Map<String, dynamic> gallery) {
    return GalleryModel(
        id: gallery['id'],
        title: gallery['title'],
        roomType: gallery['roomType'],
        style: gallery['style'],
        category: gallery['category'],
        price: gallery['price'],
        images: List<String>.from(gallery['images']));
  }

  Map<String, dynamic> toMap() => {
    'id' : id,
    'title': title,
    'roomType': roomType,
    'style':style,
    'category':category,
    'price':price,
    'images':images
  };
}
