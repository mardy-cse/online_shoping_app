class Product {
  Product({
      this.imagePath, 
      this.price, 
      this.title, 
      this.subtitle,});

  Product.fromJson(dynamic json) {
    imagePath = json['image_path'];
    price = json['price'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
  String? imagePath;
  num? price;
  String? title;
  String? subtitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_path'] = imagePath;
    map['price'] = price;
    map['title'] = title;
    map['subtitle'] = subtitle;
    return map;
  }
}