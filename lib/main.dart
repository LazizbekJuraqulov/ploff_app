import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/constants/constans.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/data/dto/detel_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';
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
import 'package:ploff_app/src/presentation/widgets/register_widget/widget.dart';
import 'package:ploff_app/src/presentation/widgets/splash_widget/language%20selection.dart';
import 'package:ploff_app/src/routes/routes.dart';
import 'src/presentation/pages/splash/splash_screen.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveProductModelAdapter());
  await Hive.openBox<HiveProductModel>("hiveProduct");

  runApp(MultiBlocProvider(providers: [
    
    BlocProvider(create: (context) => HomeBannerBloc()..add(HomeInit())),
    BlocProvider(
                      create: (context) => NavbarBloc()..add(IntilPage()),
                      child: const NavBar(),
                      
                   ),
                    BlocProvider(
                      create: (context) =>MyOrdersBloc()..add(OrdersEvent()),
                      child: MyOrdersPage(),
                    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
 const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) => RoutesPage.getRoters(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFCC00),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          )),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Color(0xffFFCC00)),
          scaffoldBackgroundColor: bacgroundColor,
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xfffffffff))),
    );
  }
}
