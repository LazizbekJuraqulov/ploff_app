import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/profil_widget/close_app_widget.dart';
import 'package:ploff_app/src/presentation/widgets/profil_widget/edit_profil.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/profil_widget/profil_widget.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage({super.key, required this.name, required this.nomer});
  String name;
  String nomer;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController nameController=TextEditingController();
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
                          trailing: InkWell(
                            onTap: () async{
                              SharedPreferences pref =
                            await SharedPreferences.getInstance();
                              nameController=(pref.getString("phone"))as TextEditingController;

                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return EditProfil(namecontroller:nameController ,);
                              // }));
                            },
                            child: SvgPicture.asset(
                                "assets/profil_icons/profil.svg"),
                          ),
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
                CloseWidget()
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
