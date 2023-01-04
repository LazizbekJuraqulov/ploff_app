import 'package:dio/dio.dart';

class RegisterApi {
  static registerApi(String name, String phone) async {
    final data = Dio().post(
        "https://test.customer.api.delever.uz/v1/customers/register",
        data: {"name": name, "phone": "+998$phone"},
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    return data;
  }
}
