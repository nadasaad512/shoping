import 'dart:io';

class Product {
  String id;
  String imageUrl;
  String name;
  String description;
  num price;
  File imageToBeUpload;
  bool iscard;
  Product(
      {this.id,
      this.name,
      this.description,
      this.imageToBeUpload,
      this.imageUrl,
      this.iscard,
      this.price});
  Product.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.description = map['description'];
    this.price = map['price'];
    this.imageUrl = map['imageUrl'];
    this.id = map['id'];
    this.iscard = map['iscard'];
  }
  toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'iscard': this.iscard,
      'imageUrl': this.imageUrl
    };
  }
}
