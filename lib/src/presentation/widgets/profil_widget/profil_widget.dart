import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilWidget extends StatelessWidget {
  String icon;
  String text;
  ProfilWidget({
    required this.icon,required this.text
    
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: SvgPicture.asset("assets/profil_icons/$icon.svg"),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000)),
        ),
        trailing: SvgPicture.asset("assets/profil_icons/cloud.svg"),
      ),
    );
  }
}