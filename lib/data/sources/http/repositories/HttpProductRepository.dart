import 'dart:convert';

import 'package:productos_prueba_tecnica_mobile/data/sources/http/util/HttpBodyPreparer.dart';
import 'package:productos_prueba_tecnica_mobile/data/sources/http/util/HttpErrorHandler.dart';
import 'package:productos_prueba_tecnica_mobile/data/sources/http/util/HttpInstace.dart';

import '../../../../domain/models/Product.dart';
import '../../../repositories/ProductRepository.dart';

class HttpProductRepository implements ProductRepository {
  String endpoint = '/product';

  @override
  Future<Product> create(Product product) async {
    final body = HttpBodyPreparer.prepare(product.toJson());

    final response = await HttpInstance().post(endpoint, body: body);

    if (response.statusCode != 201) {
      throw Exception(HttpErrorHandler.handle(response));
    }

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }

  @override
  Future<void> delete(String id) async {
    final url = '$endpoint/$id';

    final response = await HttpInstance().delete(url);

    if (response.statusCode != 204) {
      throw Exception(HttpErrorHandler.handle(response));
    }
  }

  @override
  Future<Product> get(String id) async {
    final response = await HttpInstance().get('$endpoint/$id');

    if (response.statusCode != 200) {
      throw Exception(HttpErrorHandler.handle(response));
    }

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }

  @override
  Future<List<Product>> getAll() async {
    final response = await HttpInstance().get(endpoint);

    if (response.statusCode != 200) {
      throw Exception(HttpErrorHandler.handle(response));
    }

    List<dynamic> jsonData = json.decode(response.body);

    return jsonData.map((data) => Product.fromJson(data)).toList();
  }

  @override
  Future<Product> update(Product product) async {
    final body = HttpBodyPreparer.prepare(product.toJson());
    final url = '$endpoint/${product.id}';

    final response = await HttpInstance().put(url, body: body);

    if (response.statusCode != 200) {
      throw Exception(HttpErrorHandler.handle(response));
    }

    Map<String, dynamic> jsonData = json.decode(response.body);

    return Product.fromJson(jsonData);
  }
}
