abstract class RepositoryInterface<T> {
  Future<List<T>> getAll();
  Future<T> get(String id);
  Future<T> create(T model);
  Future<T> update(T model);
  Future<void> delete(String id);
}
