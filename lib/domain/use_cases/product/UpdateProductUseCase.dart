import '../../../data/repositories/ProductRepository.dart';
import '../../models/Product.dart';

class UpdateProductUseCase {
  final ProductRepository _productRepository;

  UpdateProductUseCase(this._productRepository);

  Future<Product> execute(Product product) {
    return _productRepository.update(product);
  }
}
