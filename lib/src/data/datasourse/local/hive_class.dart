import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/datasourse/local/detelApi.dart';
import 'package:ploff_app/src/data/dto/detel_product_model.dart';

import '../../dto/hive_product_model.dart';

class HiveDataBase {
 

  List<HiveProduct> getProduct(Box box) {
    return box.values.toList().cast<HiveProduct>();
  }

  Future<void> addProduct(Box box, HiveProduct product) async {
    await box.put(product.id, product);
  }
  Future<void> updateProduct(Box box, HiveProduct product) async {
    await box.put(product.id, product);
  }

   Future<void> deleteProduct(Box box, HiveProduct product) async {
    await box.delete(product.id);
  }
   Future<void> deleteAllProduct(Box box) async {
    await box.clear();
  }

}
