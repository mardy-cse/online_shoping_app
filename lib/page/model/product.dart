class Product {
  String? id;
  String? imagePath;
  String? price;
  String? title;
  String? subtitle;
  int quantity; // Add quantity field

  Product({
    this.id,
    this.imagePath,
    this.price,
    this.title,
    this.subtitle,
    this.quantity = 1, // Set default quantity to 1
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      imagePath: json['image_path'],
      price: json['price'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_path'] = imagePath;
    map['price'] = price;
    map['title'] = title;
    map['subtitle'] = subtitle;
    return map;
  }

  // Method to increase quantity
  void increaseQuantity() {
    quantity++;
  }
}
