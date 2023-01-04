
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/constants/constans.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/splashscreen/splash_screen_bloc.dart';
import 'package:ploff_app/src/presentation/pages/basket/basket_page.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/my_orders/my_orders_page.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';
import 'package:ploff_app/src/presentation/widgets/splash_widget/language%20selection.dart';
import 'src/presentation/pages/splash/splash_screen.dart';

void main() {
  
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) =>
            SplashScreenBloc()..add(NavigateToHomeScreenEvent())),
            BlocProvider(create: (context) => NavbarBloc()..add(IntilPage())),
            BlocProvider(create: (context)=> HomeBannerBloc()..add(HomeInit())),
            BlocProvider(create: (context)=>RegisterBloc()..add(RegisterInitialEvent()))
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor:bacgroundColor),
      home:SpleshScreen(),
    );
  }
}
