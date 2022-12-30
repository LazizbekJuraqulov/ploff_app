import 'package:ploff_app/src/domain/entites/product_entites.dart';

abstract class UseCase<Type, P> {
  Future<List<ProductIntites>> call(P params);
}