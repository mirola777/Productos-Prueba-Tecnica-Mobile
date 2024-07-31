import 'package:flutter/material.dart';

import '../../data/repositories/ProductRepository.dart';
import '../../domain/models/Product.dart';
import '../../domain/use_cases/product/UpdateProductUseCase.dart';
import '../widgets/forms/DynamicForm.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen({super.key});

  @override
  _ProductUpdateScreenState createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    final fields = [
      {"name": "name", "type": "text", "value": product.name},
      {"name": "description", "type": "text", "value": product.description},
      {"name": "price", "type": "double", "value": product.price.toString()},
      {"name": "stock", "type": "int", "value": product.stock.toString()}
    ];

    updateProduct0(Map<String, dynamic> data) {
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

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: DynamicForm(fields: fields, onSubmit: updateProduct0),
        ));
  }
}
