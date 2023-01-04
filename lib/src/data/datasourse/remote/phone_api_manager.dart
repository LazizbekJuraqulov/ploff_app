import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/auth_widget.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/notficion_widget.dart';

class PhoneApi {


  static postApi(context, String phone) async {
    try {
      final nomer = await Dio().post(
          "https://test.customer.api.delever.uz/v1/customers/phone",
          data: {'phone' :phone},
          options: Options(
              headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
      if (nomer.statusCode == 200) {
        final nomer = await Dio().post(
            "https://test.customer.api.delever.uz/v1/customers/login",
            options: Options(
                headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotficionPage(
                    token: nomer.data["token"],
                  )));
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NameRegister();
      }));
    }
  }
}
