import 'package:dio/dio.dart';

class RegisterApi {
  static registerApi(String name, String phone,bool isActive) async {
    final data = await Dio().post(
      "https://test.customer.api.delever.uz/v1/customers/register-confirm",
      options: Options(headers: {
        'shipper': 'd4b1658f-3271-4973-8591-98a82939a664',
        'platform': '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f'
      }),
      data: {"name": name, "phone": "+998$phone"},
    );

    return data;
  }
}
