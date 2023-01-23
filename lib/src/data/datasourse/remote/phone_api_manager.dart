import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/auth_widget.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/notficion_register.widget.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/notficion_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            options: Options(
                headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}),
            data: {"phone": "+998$phone", "tag": ""});
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => RegisterBloc()..add(RegisterInitialEvent()),
            child: NotficionPage(),
          );
        }));
        SharedPreferences nomers = await SharedPreferences.getInstance();
        await nomers.setString("phone", "+998$phone");
        await nomers.setString("name", nomer.data["name"]);
      } else {}
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => RegisterBloc()..add(RegisterInitialEvent()),
          child: NameRegister(),
        );
      }));
      print(e);
    }
  }
}
