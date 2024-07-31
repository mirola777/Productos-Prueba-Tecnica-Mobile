import 'package:flutter/material.dart';

import '../../data/repositories/ProductRepository.dart';
import '../../domain/models/Product.dart';
import '../../domain/use_cases/product/CreateProductUseCase.dart';
import '../widgets/forms/DynamicForm.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  _ProductCreateScreenState createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  void _createProduct(Map<String, dynamic> data) {
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

  @override
  Widget build(BuildContext context) {
    final fields = [
      {"name": "name", "type": "text"},
      {"name": "description", "type": "text"},
      {"name": "price", "type": "double"},
      {"name": "stock", "type": "int"}
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DynamicForm(fields: fields, onSubmit: _createProduct),
      ),
    );
  }
}
