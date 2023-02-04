import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/splashscreen/splash_screen_bloc.dart';
import 'package:ploff_app/src/presentation/pages/index_stack/index_stack.dart';
import 'package:ploff_app/src/presentation/widgets/splash_widget/language%20selection.dart';
import 'package:ploff_app/src/presentation/widgets/splash_widget/splash_screen_widget.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  //  void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 2),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) =>Container())));
  // }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
        builder: ((context, state) {
      if (state is Loading) {
        return SplashScreenWidget();
      } else if (state is Loaded) {
        return NavBar();
      } else {
        return CircularProgressIndicator();
      }
    }));
  }
}
