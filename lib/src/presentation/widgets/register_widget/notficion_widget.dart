import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/auth_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotficionPage extends StatefulWidget {
  NotficionPage({super.key,});

  @override
  State<NotficionPage> createState() => _NotficionPageState();
}

class _NotficionPageState extends State<NotficionPage> {
  @override
  Widget build(BuildContext context) {
    final registBloc = context.read<RegisterBloc>();
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
                SizedBox(
                  child: Pinput(
                    controller: state.codeController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Неверный код";
                      }
                    },
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async{
                       // registBloc.add(SignNameEvent(context));
                       SharedPreferences nomer =
                            await SharedPreferences.getInstance();
                        
                        final isAvtive = (nomer.setBool("Active", true));
                        Navigator.pushNamedAndRemoveUntil(
                            context, "navbar", (route) => false);
                      },
                      child: InkWell(
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
