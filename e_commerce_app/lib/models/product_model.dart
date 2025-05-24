class Product {
  final int id;
  final String productName;
  final double price;
  final String description;
  final String imageUrl;
  Product(this.id, this.productName, this.price, this.description, this.imageUrl);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['title'],
      json['price'].toDouble(),
      json['description'],
      json['image'],
    );
  }
}
