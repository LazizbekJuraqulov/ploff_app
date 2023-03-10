import 'package:dio/dio.dart';
import 'package:ploff_app/src/data/dto/design_model.dart';

class DesignApi {
  static Future<DisegnModel> disegn() async {
    final respones = await Dio()
        .get("https://test.customer.api.delever.uz/v1/nearest-branch",
            options: Options(headers: {
              "Authorization":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYwMjM0NzAsImlhdCI6MTY3NDcyNzQ3MCwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiIxY2NkODRmYi05NjY2LTRjM2UtOTM4ZC1kODY1OWNmM2FhMzQiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.T6P1NPJAlJuKyjN4DH4wFQ34Km4tuoURDNDlEtq-sx8",
              'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'
            }));
    final post = DisegnModel.fromJson(respones.data);
    return post;
  }
}
