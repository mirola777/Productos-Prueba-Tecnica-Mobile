import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'util/Routes.dart';
import 'util/constants/AppRoutes.dart';

Future main() async {
  await dotenv.load();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      initialRoute: AppRoutes.products,
      routes: Routes.routes,
    );
  }
}
