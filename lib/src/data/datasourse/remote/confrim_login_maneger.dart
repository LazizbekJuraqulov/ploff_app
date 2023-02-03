import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmLoginApi {
  static postApi(String? nomer, String? code) async {
    final respons = await Dio().post(
      "https://test.customer.api.delever.uz/v1/customers/confirm-login",
      data: {"phone": nomer, "code": code},
      options: Options(headers: {
        'shipper': 'd4b1658f-3271-4973-8591-98a82939a664',
        'platform': '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f'
      }),
    );

  //   SharedPreferences token = await SharedPreferences.getInstance();
  // token.setString("token", respons.data['access_token']);

    return respons;
  }
}
