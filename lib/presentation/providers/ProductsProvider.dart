import 'package:flutter/material.dart';

import '../../data/repositories/ProductRepository.dart';
import '../../domain/models/Product.dart';
import '../../domain/use_cases/product/DeleteProductUseCase.dart';
import '../../domain/use_cases/product/GetAllProductsUseCase.dart';
import '../../util/constants/AppRoutes.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void getAllProducts() {
    final getAllProducts = GetAllProductsUseCase(getProductRepository());

    getAllProducts.execute().then((value) {
      _products.clear();
      _products.addAll(value);

      notifyListeners();
    });
  }

  void deleteProduct(Product product) {
    final deleteProduct = DeleteProductUseCase(getProductRepository());

    deleteProduct.execute(product.id).then((_) {
      _products.remove(product);

      notifyListeners();
    });
  }

  Future<void> createProduct(BuildContext context) async {
    final product =
        await Navigator.pushNamed(context, AppRoutes.productCreate) as Product?;

    if (product == null) return;

    _products.add(product);

    notifyListeners();
  }

  Future<void> updateProduct(BuildContext context, Product product) async {
    final updatedProduct = await Navigator.pushNamed(
        context, AppRoutes.productUpdate,
        arguments: product) as Product?;

    if (updatedProduct == null) return;

    final index =
        _products.indexWhere((element) => element.id == updatedProduct.id);

    _products[index] = updatedProduct;

    notifyListeners();
  }

  void openProduct(BuildContext context, Product product) {
    Navigator.pushNamed(context, AppRoutes.product, arguments: product);
  }
}
