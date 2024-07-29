import '../../../data/repositories/ProductRepository.dart';
import '../../models/Product.dart';

class GetAllProductsUseCase {
  final ProductRepository _productRepository;

  GetAllProductsUseCase(this._productRepository);

  Future<List<Product>> execute() {
    return _productRepository.getAll();
  }
}
