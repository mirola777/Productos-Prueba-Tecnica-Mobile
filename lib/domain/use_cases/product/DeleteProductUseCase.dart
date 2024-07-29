import '../../../data/repositories/ProductRepository.dart';

class DeleteProductUseCase {
  final ProductRepository _productRepository;

  DeleteProductUseCase(this._productRepository);

  Future<void> execute(String id) {
    return _productRepository.delete(id);
  }
}
