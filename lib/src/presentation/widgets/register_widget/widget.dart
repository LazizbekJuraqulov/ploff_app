import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';

import 'notficion_widget.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({
    Key? key,
  }) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final blocPhone = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is Phone) {
        return Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    "Регистрация",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Номер телефона",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Form(
                    key: formGlobalKey,
                    child: TextFormField(
                      controller: state.nomer,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Введите номер телефона";
                        } else if (value.length < 3) {
                          return "Введите номер телефона";
                        }
                      }),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                  color: Color(0xFF707070), width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color(0xFFFFCC00), width: 1)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFFFFCC00), width: 1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          prefixText: "+998",
                          prefixStyle: const TextStyle(
                              color: Color(0xff2B2A28), fontSize: 15)),
                      maxLength: 9,
                      cursorColor: Color(0xffFFCC00),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff2B2A28),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NotficionPage(
                            token: "",
                          );
                        }));
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        blocPhone.add(PhoneEvent());
                      },
                      child: Container(
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffFFCC00),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "Продолжить",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
