import 'package:dio/dio.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';

class PloffApi{
  static Future<List<ProductModel>> productApi(int page)async{
     const limit = 10;
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=${limit}&all=true");
    final data = respone.data as List;
    List<ProductModel> posts = data.map((e) => ProductModel.fromJson(e)).toList();
    return posts;
  }
  }
