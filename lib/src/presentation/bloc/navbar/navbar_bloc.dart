import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/presentation/bloc/register_bloc/bloc/register_bloc.dart';
import 'package:ploff_app/src/presentation/pages/basket/basket_page.dart';
import 'package:ploff_app/src/presentation/pages/home/home_page.dart';
import 'package:ploff_app/src/presentation/pages/my_orders/my_orders_page.dart';
import 'package:ploff_app/src/presentation/pages/nav_bar/navbar_page.dart';
import 'package:ploff_app/src/presentation/pages/profile/profile_page.dart';
import 'package:ploff_app/src/presentation/pages/registration/registration_page.dart';
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<AfterPage>((event, emit) async {
      final state = this.state as Active;
      SharedPreferences presf = await SharedPreferences.getInstance();
      state.name = (presf.getString("name").toString());
      state.nomer = (presf.getString("phone").toString());

      state.isTrue = (presf.getBool("Active") ?? false);

      if (event.activeIndex == 2 || event.activeIndex == 3) {
        if (state.isTrue == false) {
          Navigator.push(event.context, MaterialPageRoute(builder: ((context) {
            return BlocProvider(
              create: ((context) =>
                  RegisterBloc()..add(RegisterInitialEvent())),
              child: Registration(),
            );
          })));
        }
      }

      emit(Active(event.activeIndex, state.active, state.isTrue,state.name,state.nomer));
    });
    on<IntilPage>((event, emit) {
      emit(Active(0, 0, false, "", ""));
    });
  }
}
