import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';

class NameRegister extends StatefulWidget {
  NameRegister({super.key});

  @override
  State<NameRegister> createState() => _NameRegisterState();
}

class _NameRegisterState extends State<NameRegister> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is Phone) {
        return Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: AppBar(
              backgroundColor: Color(0xffffffff),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset("assets/svg_icons/close.svg"),
              )),
          body: Container(
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
                      "Имя фамилия",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400),
                    ),
                    TextFormField(
                      controller: state.nameController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Введите ваше имя";
                        }
                      }),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff2B2A28),
                      ),
                      cursorColor: Color(0xffFFCC00),
                      decoration: InputDecoration(
                        hintText: "Введите имя",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(color: Color(0xFF707070), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFFFFCC00), width: 1)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xFFFFCC00), width: 1),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return NavBar();
                        }), (route) => false);
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
                    )
                  ],
                )
              ],
            ),
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
