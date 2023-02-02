import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key, required this.disegnbloc, required this.state})
      : super(key: key);

  final DisegnBlocBloc disegnbloc;
  final DisegnState state;

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  List topay = ["Наличные", "Payme", "Click"];
  List icons = [
    "assets/img/mane.png",
    "assets/img/payme.png",
    "assets/img/click.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text("Тип оплаты", style: textStyle),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    widget.disegnbloc.add(PaymentEvent(index));
                  },
                  child: ListTile(
                    leading: Image.asset(icons[index]),
                    title: Text(topay[index].toString(), style: textOrder),
                    trailing: widget.state.isPayList![index]
                        ? SvgPicture.asset("assets/home_/activ_.svg")
                        : SvgPicture.asset("assets/home_/not_activ_.svg"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 3),
        ],
      ),
    );
  }
}
