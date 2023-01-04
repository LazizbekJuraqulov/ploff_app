import 'package:dio/dio.dart';

class confirmLoginApi {
  static postApi(String? nomer,String? token,String? code ) async  {
    final postman = await Dio().post(
        "https://test.customer.api.delever.uz/v1/customers/login",
        data:{"phone":nomer,"fcm_token":token,"code":code},
        
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
    return postman;
  }
}
