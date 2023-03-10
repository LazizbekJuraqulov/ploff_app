import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/constants/test.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/my_orders/bloc/my_orders_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/splashscreen/splash_screen_bloc.dart';
import 'package:ploff_app/src/presentation/pages/basket/basket_page.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/index_stack/index_stack.dart';
import 'package:ploff_app/src/presentation/pages/my_orders/my_orders_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/design_widget.dart';
import 'package:ploff_app/src/presentation/widgets/home_widget/product_order.dart';

import '../presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';

class RoutesPage {
  static getRoters(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) =>SplashScreenBloc()..add(NavigateToHomeScreenEvent()),
                      child: const SpleshScreen(),
                    );;
        });
        
        case "navbar":
       return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) => NavbarBloc()..add(IntilPage()),
                      child: const NavBar(),
                    );
        });
      
      case "home":
       return MaterialPageRoute(builder: (context) {
          return BlocProvider(create: (context) => HomeBannerBloc()..add(HomeInit()),child: HomePage(),);

        });
        
      case "basket":
       return MaterialPageRoute(builder: (context) {
          return BasketPage();
        });
       
        case "order":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) =>MyOrdersBloc()..add(OrdersEvent()),
                      child: MyOrdersPage(),
                    );
        });
        
       case "profil":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) =>RegisterBloc()..add(RegisterInitialEvent()),
                      child: ProfilPage(name: "",nomer: "",),
                    );
        });
       
         case "design":
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
                      create: (context) => DisegnBlocBloc()..add(DisegnnEvent()),
                      child:DesignPage(),
                    );
        });
          case "test":
       return MaterialPageRoute(builder: (context) {
          return PlacemarkMapObjectPage();
        });
     

      default:
    }
  }
}
