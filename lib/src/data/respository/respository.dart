import 'package:ploff_app/src/data/datasourse/remote/home_api_maneger.dart';
import 'package:ploff_app/src/domain/entites/product_entites.dart';
import 'package:ploff_app/src/domain/respository/product_respository.dart';

class ProductRepo extends ProductRespository {
  @override
  Future<List<ProductIntites>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
//   @override
//   Future<List<ProductIntites>> getProduct(int pageKey) async {
//     final datas = await PloffApi.productApi();
//     final poste =
// datas.map((e) => ProductIntites(e.categories, e.count)).toList();

//     return poste;
//   }
}
