import 'package:flutter/material.dart';
import 'package:productos_prueba_tecnica_mobile/presentation/providers/ProductUpdateProvider.dart';
import 'package:provider/provider.dart';

import '../../domain/models/Product.dart';
import '../../util/constants/AppColors.dart';
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

    return ChangeNotifierProvider(
        create: (_) => ProductUpdateProvider(),
        child:
            Consumer<ProductUpdateProvider>(builder: (context, provider, __) {
          return Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                backgroundColor: AppColors.primary,
                iconTheme: const IconThemeData(color: AppColors.text),
                title: const Text('Update Product',
                    style: TextStyle(color: AppColors.text)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: DynamicForm(
                    fields: fields,
                    onSubmit: (data) =>
                        provider.updateProduct(context, data, product)),
              ));
        }));
  }
}
