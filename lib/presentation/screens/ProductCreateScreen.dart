import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/constants/AppColors.dart';
import '../providers/ProductCreateProvider.dart';
import '../widgets/forms/DynamicForm.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  _ProductCreateScreenState createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    final fields = [
      {"name": "name", "type": "text"},
      {"name": "description", "type": "text"},
      {"name": "price", "type": "double"},
      {"name": "stock", "type": "int"}
    ];

    return ChangeNotifierProvider(
        create: (_) => ProductCreateProvider(),
        child:
            Consumer<ProductCreateProvider>(builder: (context, provider, __) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              iconTheme: const IconThemeData(color: AppColors.text),
              title: const Text('Create Product',
                  style: TextStyle(color: AppColors.text)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DynamicForm(
                  fields: fields,
                  onSubmit: (data) => provider.createProduct(context, data)),
            ),
          );
        }));
  }
}
