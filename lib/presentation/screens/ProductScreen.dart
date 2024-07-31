import 'package:flutter/material.dart';

import '../../domain/models/Product.dart';
import '../../util/constants/AppColors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.text),
        title:
            Text(product.name, style: const TextStyle(color: AppColors.text)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, color: AppColors.text, size: 80),
            Text(product.name,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            Text('\$${product.price}',
                style: const TextStyle(color: AppColors.text, fontSize: 20)),
            Text('${product.stock} in stock',
                style: const TextStyle(color: AppColors.text)),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Text(product.description ?? '',
                style: const TextStyle(color: AppColors.text)),
            const Divider(
              height: 40,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
