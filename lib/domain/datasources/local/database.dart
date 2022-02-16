

abstract class Database<U> {
  List<T> getAll<T>();
  T get<T>(String id, {T? defaultValue});
  Future addUpdate<T>(String id, T item);
  Future delete(String id);

}
