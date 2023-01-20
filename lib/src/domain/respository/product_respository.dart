import 'package:ploff_app/src/domain/entites/product_entites.dart';

abstract class ProductRespository {
  Future<List<ProductEntity>> getProduct();
}