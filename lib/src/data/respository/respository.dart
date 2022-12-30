import 'package:ploff_app/src/data/datasourse/remote/home_api_maneger.dart';
import 'package:ploff_app/src/domain/entites/product_entites.dart';
import 'package:ploff_app/src/domain/respository/product_respository.dart';

class ProductRepo extends ProductRespository {
  @override
  Future<List<ProductIntites>> getProduct(int pageKey) async {
    final datas = await PloffApi.productApi(pageKey);
    final poste =
        datas.map((e) => ProductIntites(e.categories, e.count)).toList();

    return poste;
  }
}
