import 'package:dio/dio.dart';

class LoginApi {
  static loginPost(String nomer,String tag) async {
    final login =
        Dio().post("https://test.customer.api.delever.uz/v1/customers/login",data: {"phone":"+998$nomer","tag":tag});
  }
}
