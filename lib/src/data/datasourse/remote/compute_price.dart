import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestCompOrder {

  static Future setcompRequest() async {
    Map data = {
     "branch_id": "d94ba13f-932b-428c-b251-c283ee553d97",
  "lat": 41.2729261,
  "long": 69.2789445,
  "order_price": 10000.0
    };
    final body = jsonEncode(data);

    SharedPreferences client = await SharedPreferences.getInstance();

    final respones = await Dio()
        .post("https://test.customer.api.delever.uz/v1/fares/compute-price",
            options: Options(
              headers: {
                "Authorization":
                    //client.getString("token"),
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYwMjM0NzAsImlhdCI6MTY3NDcyNzQ3MCwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiIxY2NkODRmYi05NjY2LTRjM2UtOTM4ZC1kODY1OWNmM2FhMzQiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.T6P1NPJAlJuKyjN4DH4wFQ34Km4tuoURDNDlEtq-sx8",
                'shipper': 'd4b1658f-3271-4973-8591-98a82939a664',
                'content-type': 'application/json; charset=UTF-8'
              },
            ),
            data: body);
    //client.setString("client_id", respones.data["client_id"]);
    print(respones.data);
  }
}