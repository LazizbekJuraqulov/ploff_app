import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/splashscreen/splash_screen_bloc.dart';
import 'package:ploff_app/src/presentation/pages/basket/basket_page.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/my_orders/my_orders_page.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:ploff_app/src/presentation/widgets/home_widget/product_order.dart';

class RoutesPage {
  static getRoters(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) =>SplashScreenBloc()..add(NavigateToHomeScreenEvent()),
                      child: SpleshScreen(),
                    );;
        });
        
        case "navbar":
       return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) => NavbarBloc()..add(IntilPage()),
                      child: NavBar(),
                    );
        });
      
      case "home":
       return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
        
      case "basket":
       return MaterialPageRoute(builder: (context) {
          return BasketPage();
        });
        
        case "order":
       return MaterialPageRoute(builder: (context) {
          return MyOrdersPage();
        });
        
       case "profil":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) =>RegisterBloc()..add(RegisterInitialEvent()),
                      child: ProfilPage(name: "",nomer: "",),
                    );;
        });
        
     

      default:
    }
  }
}
