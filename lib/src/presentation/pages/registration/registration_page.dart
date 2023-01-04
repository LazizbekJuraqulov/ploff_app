import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';

import '../../widgets/register_widget/widget.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
          body: RegisterWidget(),
        );
      } else {
        return Scaffold(
          body: Container(),
        );
      }
    });
  }
}
