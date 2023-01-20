import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/auth_widget.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/notficion_register.widget.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/notficion_widget.dart';

class PhoneApi {
  static postApi(context, String phone) async {
    try {
      final nomer = await Dio().post(
          "https://test.customer.api.delever.uz/v1/customers/phone",
          data: {'phone': "+998$phone"},
          options: Options(
              headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
      if (nomer.statusCode == 200) {
        await Dio().post(
            "https://test.customer.api.delever.uz/v1/customers/login",
            data: {"phone": "+998$phone", "tag": 'aa'});
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RegisterNotficion();
        }));
      }
    } catch (e) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return RegisterNotficion();
      // }));
      print(e);
    }
  }
}
