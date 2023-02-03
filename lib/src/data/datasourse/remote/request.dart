import 'dart:convert';

import 'package:dio/dio.dart';

class RequestOrder {
  static Future setRequest() async {
    Map data = {
      "apartment": "",
      "building": "",
      "client_id": "c935a462-426f-4b20-93f9-07d2f5ac3458",
      "co_delivery_price": 0,
      "delivery_time": "",
      "delivery_type": "self-pickup",
      "description": "",
      "is_courier_call": true,
      "extra_phone_number": "",
      "floor": "",
      "paid": false,
      "payment_type": "cash",
      "source": "android",
      "status_id": "",
      "steps": [
        {
          "branch_id": "f160c975-0da4-43e5-b289-2fc6eff99ea5",
          "description": "",
          "products": [
            {
              "description": "",
              "type": "simple",
              "price": "14000.0",
              "product_id": "c3e707a2-cda9-4c66-86ef-7c25f7e88fa3",
              "quantity": 1.0,
              "order_modifiers": [],
              "variants": []
            }
          ]
        }
      ],
      "to_address": "O'zbekiston, Toshkent, Shahrisabz ko'chasi, 85",
      "to_location": {"lat": 41.3485775, "long": 69.3360915},
      "future_time": null
    };
    final body =jsonEncode(data);
     final respones = await Dio()
        .post("https://test.customer.api.delever.uz/v2/ondemand-order",
            options: Options(headers: {
              "Authorization":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYwMjM0NzAsImlhdCI6MTY3NDcyNzQ3MCwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiIxY2NkODRmYi05NjY2LTRjM2UtOTM4ZC1kODY1OWNmM2FhMzQiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.T6P1NPJAlJuKyjN4DH4wFQ34Km4tuoURDNDlEtq-sx8",
              'shipper': 'd4b1658f-3271-4973-8591-98a82939a664',
              'content-type': 'application/json; charset=UTF-8'
            }, ),data: body);
            
  }

  }


  
  




























//import 'package:http/http.dart' as http;


// class MyOrderApi {
//   static Future createAlbum(String title,bool isTrue) async {
//   final http.Response response = await http.post(
//     Uri.parse("https://test.customer.api.delever.uz/v2/ondemand-order",),
//     headers: <String, String>{
//       "Authorization":
//                   "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzYwMjM0NzAsImlhdCI6MTY3NDcyNzQ3MCwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiIxY2NkODRmYi05NjY2LTRjM2UtOTM4ZC1kODY1OWNmM2FhMzQiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.T6P1NPJAlJuKyjN4DH4wFQ34Km4tuoURDNDlEtq-sx8",
//               'shipper': 'd4b1658f-3271-4973-8591-98a82939a664',
//       'content-type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
      
//   "apartment": "",
//   "building": "",
//   "client_id": "c935a462-426f-4b20-93f9-07d2f5ac3458",
//   "co_delivery_price": 0,
//   "delivery_time": "",
//   "delivery_type": "self-pickup",
//   "description": "",
//   "is_courier_call": true,
//   "extra_phone_number": "",
//   "floor": "",
//   "paid": false,
//   "payment_type": "cash",
//   "source": "android",
//   "status_id": "",
//   "steps": [
//     {
//       "branch_id": "f160c975-0da4-43e5-b289-2fc6eff99ea5",
//       "description": "",
//       "products": [
//         {
//           "description": "",
//           "type": "simple",
//           "price": "14000.0",
//           "product_id": "c3e707a2-cda9-4c66-86ef-7c25f7e88fa3",
//           "quantity": 1.0,
//           "order_modifiers": [],
//           "variants": []
//         }
//       ]
//     }
//   ],
//   "to_address": "O'zbekiston, Toshkent, Shahrisabz ko'chasi, 85",
//   "to_location": {
//     "lat": 41.3485775,
//     "long": 69.3360915
//   },
//   "future_time": null

//     }),
//   );
// }
  
// }
