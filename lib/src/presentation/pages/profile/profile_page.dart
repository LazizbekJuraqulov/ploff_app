import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';

import '../../widgets/profil_widget/profil_widget.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage({
    super.key,
    required this.name,required this.nomer
  });
  String name;
  String nomer;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      if (state is Phone) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Профиль",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 12),
                      child: Container(
                        alignment: Alignment.center,
                        height: 90,
                        decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(
                            widget.name.toString(),
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "+998${widget.nomer}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff5F5F5F),
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                              "assets/profil_icons/profil.svg"),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffffffff),
                      ),
                      height: MediaQuery.of(context).size.height * 0.39,
                      child: Column(
                        children: [
                          ProfilWidget(icon: "local", text: "Филиалы"),
                          const Divider(),
                          ProfilWidget(icon: "setting", text: "Настройки"),
                          const Divider(),
                          ProfilWidget(icon: "map", text: "Мои адресы"),
                          const Divider(),
                          ProfilWidget(icon: "oprog", text: "О сервисе")
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 16, top: 80),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 100,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Вы хотите выйти из своей учетной записи?"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                height: 50,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Color(0xfff5f5f5)),
                                                child: Text(
                                                  "отмена",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                alignment: Alignment.center,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Color(0xffFFCC00)),
                                                child: Text(
                                                  "выход",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffffffff),
                          ),
                          child: const Text(
                            "Выйти",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffF2271C),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Center(
                        child: Text(
                          "Version 1.0.0",
                          style: TextStyle(
                              color: Color(0xff858585),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
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
