import 'package:flutter/material.dart';

class ItemsListWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T) itemBuilder;

  const ItemsListWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 10,
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemBuilder(items[index]);
      },
    );
  }
}
