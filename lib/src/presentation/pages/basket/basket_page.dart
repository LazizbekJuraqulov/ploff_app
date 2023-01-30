import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/basket_widget/basket_isEmpty_widget.dart';
import 'package:ploff_app/src/presentation/widgets/basket_widget/basket_isnotEmty_widget.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderproductBloc>();
    return BlocBuilder<OrderproductBloc, OrderproductState>(
        builder: (context, state) {
      if (state is OrderState) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Корзина",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000)),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Очистить корзину?",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff0000000),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                      child: Center(
                                        child: Text(
                                          "Вы уверены, что хотите очистить корзину?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff858585),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                content: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffF2F2F2),
                                              minimumSize: Size(100, 52),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Нет",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff0000000),
                                                fontWeight: FontWeight.w600),
                                          )),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: Size(100, 52),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () {
                                            orderBloc.add(DeleteAllProduct());
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Да",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff0000000),
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: SvgPicture.asset("assets/home_/basket.svg")),
                ),
              ),
            ],
          ),
          body: HiveBox.getbox().isNotEmpty
              ? BasketisNotEmpty(orderBloc: orderBloc)
              : BasketisEmpty(),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
