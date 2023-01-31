import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';

class HiveBox {
  static Box<HiveProductModel> getbox() => Hive.box("hiveProduct");
}
