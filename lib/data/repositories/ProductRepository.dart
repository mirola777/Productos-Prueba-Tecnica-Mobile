import 'package:productos_prueba_tecnica_mobile/data/repositories/RepositoryInterface.dart';
import 'package:productos_prueba_tecnica_mobile/data/sources/http/repositories/HttpProductRepository.dart';

import '../../domain/models/Product.dart';

abstract class ProductRepository implements RepositoryInterface<Product> {}

ProductRepository getProductRepository() => HttpProductRepository();
