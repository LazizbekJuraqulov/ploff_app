import 'package:hive_flutter/hive_flutter.dart';

class HiveProduct {
     
  final productBox = Hive.box("product_box");
  void hivedata() {
    final data = productBox.keys.map((key) {
      final item = productBox.get(key);
      return {"key": key, "title": item["title"], "narx": item["narx"]};
    }).toList();
    
  }
}
