import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/name_register.dart';

class NotficionPage extends StatefulWidget {
  const NotficionPage({super.key});

  @override
  State<NotficionPage> createState() => _NotficionPageState();
}

class _NotficionPageState extends State<NotficionPage> {
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Form(
                key: formGlobalKey,
                child: Pinput(
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
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      formGlobalKey.currentState!.save();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NameRegister();
                      }));
                    }
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
  }
}
