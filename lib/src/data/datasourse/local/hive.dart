import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';
import 'package:ploff_app/src/data/dto/idproduct.dart';

class HiveProduct {
  static Future<IdProduct> productHive(String productID) async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/product/$productID",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
   // final data = respone.data as List;
    IdProduct poste =  IdProduct.fromJson(respone.data);
    return poste;
  }
}
