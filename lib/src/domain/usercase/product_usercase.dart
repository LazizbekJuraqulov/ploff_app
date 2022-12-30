import 'package:ploff_app/src/core/usercase/users.dart';
import 'package:ploff_app/src/data/respository/respository.dart';
import 'package:ploff_app/src/domain/entites/product_entites.dart';

class GetProduct extends UseCase {
  ProductRepo respost;
  GetProduct(this.respost);

  @override
  Future<List<ProductIntites>> call(dynamic params) async {
    final result = await respost.getProduct(params);
    return result;
  }
}
