import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';

class BasketisEmpty extends StatelessWidget {
  const BasketisEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navbarbloc = context.read<NavbarBloc>();
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        if (state is Active) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/home_/fil.png"),
                  SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "В корзине пока нет продукты",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5F5F5F)),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      
                      navbarbloc.add(Transfer());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 52),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                             navbarbloc.add(Transfer());
                          },
                          child: Text(
                            "+ Добавить продукт",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)),
                          )),
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
