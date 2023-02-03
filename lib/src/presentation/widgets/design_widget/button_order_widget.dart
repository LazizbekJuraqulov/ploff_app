import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';

class Oformit extends StatefulWidget {
  const Oformit({
    Key? key,
  }) : super(key: key);

  @override
  State<Oformit> createState() => _OformitState();
}

class _OformitState extends State<Oformit> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NavbarBloc>();
    return BlocProvider(
      create: (context) => NavbarBloc()..add(IntilPage()),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          if (state is Active) {
            return InkWell(

              onTap: () {
                bloc.add(MyOrderTransferEvent());
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    color: Color(0xffffffff),
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 52),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () async{
                           bloc.add(MyOrderTransferEvent());
                        },
                        child: const Text("Заказать", style: buttontext)),
                  )
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
