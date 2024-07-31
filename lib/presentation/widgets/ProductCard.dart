import 'package:flutter/material.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
              ),
              Text('Stock: ${product.stock}'),
              const Divider(
                height: 10,
                color: Colors.transparent,
              ),
              const Text('Description:'),
              Text(product.description ?? ''),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                  ),
                  Text(product.description ?? ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
