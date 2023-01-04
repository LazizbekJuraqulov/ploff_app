import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';

class SelectLang extends StatefulWidget {
  const SelectLang({super.key});

  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 148,
                height: 132,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/splash.png"))),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                "Выберите язык:",
                style: TextStyle(
                    color: Color(0xff252C32),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterWidget();
                  }), (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF7F7F7),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/img/uzb.png"),
                    ),
                    title: Text(
                      "O`zbekcha",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff0000000),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              InkWell(
                 onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterWidget();
                  }), (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF7F7F7),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/img/rus.png"),
                    ),
                    title: Text(
                      "Русский",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff0000000),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              InkWell(
                 onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterWidget();
                  }), (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF7F7F7),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/img/eng.png"),
                    ),
                    title: Text(
                      "English",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff0000000),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
