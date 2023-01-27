import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';
import 'package:ploff_app/src/data/dto/detel_product_model.dart';

class DetelApi {
  static Future<IdProduct> productHive(String productID) async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/product/$productID",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
   
    IdProduct poste =  IdProduct.fromJson(respone.data);
    return poste;
  }
}
