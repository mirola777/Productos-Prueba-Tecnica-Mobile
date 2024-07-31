import 'package:flutter/material.dart';
import 'package:productos_prueba_tecnica_mobile/presentation/screens/ProductCreateScreen.dart';
import 'package:productos_prueba_tecnica_mobile/presentation/screens/ProductUpdateScreen.dart';
import 'package:productos_prueba_tecnica_mobile/util/constants/AppRoutes.dart';

import '../presentation/screens/ProductScreen.dart';
import '../presentation/screens/ProductsListScreen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.product: (context) => const ProductScreen(),
    AppRoutes.products: (context) => const ProductListScreen(),
    AppRoutes.productCreate: (context) => const ProductCreateScreen(),
    AppRoutes.productUpdate: (context) => const ProductUpdateScreen(),
  };
}
