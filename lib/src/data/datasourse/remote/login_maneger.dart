import 'package:dio/dio.dart';

class LoginApi {
  static postApi() async {
    final postman = await Dio()
        .post("https://test.customer.api.delever.uz/v1/customers/login");
        
  }
}
