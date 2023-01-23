import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/pages/basket/basket_page.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/my_orders/my_orders_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  static bool? nom = false;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  

  @override
  Widget build(BuildContext context) {
    final blocnav = context.read<NavbarBloc>();
    return BlocBuilder<NavbarBloc, NavbarState>(builder: ((context, state) {
      if (state is Active) {
        return Scaffold(
          body: IndexedStack(
            index: state.active,
            
             children: [HomePage(),BasketPage(), MyOrdersPage(),BlocProvider(create: ((context) => RegisterBloc()..add(RegisterInitialEvent())),child:ProfilPage(name: state.name, nomer: state.nomer) ,)],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Color(0xffFFCC00),
            unselectedItemColor: Color(0xff9AA6AC),
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontSize: 10),
            unselectedFontSize: 10,
            currentIndex: state.active,
            onTap: (v) {
              blocnav.add(AfterPage(v,context));
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/home.svg"),
                  label: "Главная",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/home_activ.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/cart3.svg"),
                  label: "Корзина",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/activ_shops.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/shop.svg"),
                  label: "Мои заказы",
                  activeIcon: SvgPicture.asset("assets/svg_icons/ashop.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/person.svg"),
                  label: "Профиль",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/activ_user.svg")),
            ],
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }
}
