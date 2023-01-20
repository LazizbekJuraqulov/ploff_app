import 'package:ploff_app/src/domain/entites/product_entites.dart';

abstract class ProductCase<T, P> {
  Future<List<ProductEntity>> call();
}
