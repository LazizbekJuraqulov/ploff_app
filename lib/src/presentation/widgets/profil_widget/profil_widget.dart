import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';

class ProfilWidget extends StatelessWidget {
  String icon;
  String text;
  ProfilWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is Phone) {
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
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
