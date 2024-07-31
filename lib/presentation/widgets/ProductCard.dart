import 'package:flutter/material.dart';
import 'package:productos_prueba_tecnica_mobile/util/constants/AppColors.dart';

import '../../domain/models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function()? onTap;
  final Function()? onDelete;
  final Function()? onEdit;

  const ProductCard(
      {super.key,
      required this.product,
      this.onTap,
      this.onDelete,
      this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: onTap,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: AppColors.text),
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: AppColors.text),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
