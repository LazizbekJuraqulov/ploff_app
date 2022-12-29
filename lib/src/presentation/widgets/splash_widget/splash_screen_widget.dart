import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Center(child: Image.asset("assets/img/splash.png")),
          const  SizedBox(
            width: 20,
            height: 20,
            child:  CircularProgressIndicator(
              color: Color(0xff9AA6AC),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
