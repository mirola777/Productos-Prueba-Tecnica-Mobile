import 'package:flutter/material.dart';
import 'package:productos_prueba_tecnica_mobile/presentation/widgets/lists/ItemsListWidget.dart';
import 'package:productos_prueba_tecnica_mobile/util/constants/AppColors.dart';
import 'package:provider/provider.dart';

import '../../domain/models/Product.dart';
import '../providers/ProductsProvider.dart';
import '../widgets/ProductCard.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ProductsProvider(),
        child: Consumer<ProductsProvider>(builder: (context, provider, __) {
          provider.getAllProducts();

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              iconTheme: const IconThemeData(color: AppColors.text),
              title: const Text('Products',
                  style: TextStyle(color: AppColors.text)),
            ),
            body: ItemsListWidget<Product>(
              items: provider.products,
              itemBuilder: (product) => ProductCard(
                  product: product,
                  onTap: () {
                    provider.openProduct(context, product);
                  },
                  onEdit: () {
                    provider.updateProduct(context, product);
                  },
                  onDelete: () {
                    provider.deleteProduct(product);
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.createProduct(context);
              },
              child: const Icon(Icons.add),
            ),
          );
        }));
  }
}
