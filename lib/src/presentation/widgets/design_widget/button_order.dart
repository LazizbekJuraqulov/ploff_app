import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/remote/compute_price.dart';
import 'package:ploff_app/src/data/datasourse/remote/request.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/pages/index_stack/index_stack.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              color: Color(0xffffffff),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 52),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: ()  {
                          RequestCompOrder.setcompRequest();
                          HiveBox.getbox().clear();
                          final body = RequestOrder.setRequest();
                     Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => BlocProvider(
                                  create: (context) => NavbarBloc()
                                    ..add(IntilPage())
                                    ..add(MyOrderTransferEvent()),
                                  //..add(Transfer3Event()),
                                  child: const NavBar(),
                                ))),
                        (route) => false);
                          print(body);
                  },
                  child: const Text("Заказать", style: buttontext)),
            )
          ],
        ));
  }
}
