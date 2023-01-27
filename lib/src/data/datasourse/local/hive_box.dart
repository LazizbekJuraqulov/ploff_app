import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';

class HiveBox {
  static Box<HiveProduct> getbox() => Hive.box("hive_dates");
}
