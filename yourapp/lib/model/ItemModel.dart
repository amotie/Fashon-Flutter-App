class ItemModel {
  String name;
  String brand;
  String price;
  List<String> imageUrls;
  List<String> colors;
  List<String> sizes;
  double rating;
  String description;
  ItemModel({
    this.name,
    this.brand,
    this.price,
    this.imageUrls,
    this.colors,
    this.sizes,
    this.rating,
    this.description,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        name: json["name"],
        brand: json["brand"],
        price: json["price"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x['url'])),
        colors: List<String>.from(json["colors"].map((x) => x['color'])),
        sizes: List<String>.from(json["sizes"].map((x) => x['size'])),
        rating: json["rating"].toDouble(),
        description: json["description"],
    );
}
