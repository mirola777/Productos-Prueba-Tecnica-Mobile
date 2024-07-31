import 'package:productos_prueba_tecnica_mobile/util/Parser.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String? description;
  final String? image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: Parser.parseString(json['id']),
      name: Parser.parseString(json['name']),
      price: Parser.parseDouble(json['price']),
      stock: Parser.parseInt(json['stock']),
      description: Parser.parseString(json['description']),
      image: Parser.parseString(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'description': description,
      'image': image,
    };
  }
}
