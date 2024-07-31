import 'package:flutter/material.dart';

import '../../data/repositories/ProductRepository.dart';
import '../../domain/models/Product.dart';
import '../../domain/use_cases/product/CreateProductUseCase.dart';

class ProductCreateProvider with ChangeNotifier {
  Future<void> createProduct(
      BuildContext context, Map<String, dynamic> data) async {
    final createProduct = CreateProductUseCase(getProductRepository());

    final product = Product.fromJson(data);

    createProduct.execute(product).then((createdProduct) {
      Navigator.pop(context, createdProduct);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
  }
}
