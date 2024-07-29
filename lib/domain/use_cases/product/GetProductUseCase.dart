import '../../../data/repositories/ProductRepository.dart';
import '../../models/Product.dart';

class GetProductUseCase {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  Future<Product> execute(String id) {
    return _productRepository.get(id);
  }
}
