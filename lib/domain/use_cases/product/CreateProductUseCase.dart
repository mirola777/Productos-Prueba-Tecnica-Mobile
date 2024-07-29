import '../../../data/repositories/ProductRepository.dart';
import '../../models/Product.dart';

class CreateProductUseCase {
  final ProductRepository _productRepository;

  CreateProductUseCase(this._productRepository);

  Future<Product> execute(Product product) {
    return _productRepository.create(product);
  }
}
