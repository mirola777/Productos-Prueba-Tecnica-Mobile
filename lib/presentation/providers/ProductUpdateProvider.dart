import 'package:flutter/material.dart';

import '../../data/repositories/ProductRepository.dart';
import '../../domain/models/Product.dart';
import '../../domain/use_cases/product/UpdateProductUseCase.dart';

class ProductUpdateProvider with ChangeNotifier {
  Future<void> updateProduct(
      BuildContext context, Map<String, dynamic> data, Product product) async {
    final updateProduct = UpdateProductUseCase(getProductRepository());

    data['id'] = product.id;

    final productToUpdate = Product.fromJson(data);

    updateProduct.execute(productToUpdate).then((updatedProduct) {
      Navigator.pop(context, updatedProduct);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    });
  }
}
