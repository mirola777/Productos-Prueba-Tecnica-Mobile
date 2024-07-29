import 'dart:convert';

import 'package:productos_prueba_tecnica_mobile/data/sources/http/util/HttpInstace.dart';

import '../../../../domain/models/Product.dart';
import '../../../repositories/ProductRepository.dart';

class HttpProductRepository implements ProductRepository {
  String endpoint = '/product';

  @override
  Future<Product> create(Product product) async {
    final body = json.encode(product.toJson());

    final response = await HttpInstance().post(endpoint, body: body);

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }

  @override
  Future<void> delete(String id) async {
    await HttpInstance().delete('$endpoint/$id');
  }

  @override
  Future<Product> get(String id) async {
    final response = await HttpInstance().get('$endpoint/$id');

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }

  @override
  Future<List<Product>> getAll() async {
    final response = await HttpInstance().get(endpoint);

    List<dynamic> jsonData = json.decode(response.body);

    return jsonData.map((data) => Product.fromJson(data)).toList();
  }

  @override
  Future<Product> update(Product product) async {
    final body = json.encode(product.toJson());

    final response =
        await HttpInstance().put('$endpoint/${product.id}', body: body);

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }
}
