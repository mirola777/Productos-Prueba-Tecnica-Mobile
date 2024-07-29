import 'package:flutter/material.dart';

import 'presentation/screens/ProductsListScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Products', home: ProductListScreen());
  }
}
