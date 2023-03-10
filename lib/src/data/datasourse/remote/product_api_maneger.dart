import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';

class PloffApi {
  static Future<ProductModel> productApi() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=10&all=true",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
    final post= ProductModel.fromJson(respone.data);
    return post;
  }
}
