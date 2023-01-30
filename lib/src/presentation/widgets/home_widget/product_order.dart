import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/datasourse/local/hivemodel.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/data/dto/detel_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';

class ProductOrder extends StatefulWidget {
  const ProductOrder({
    super.key,
  });

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  bool isData = false;
  @override
  Widget build(BuildContext context) {
    final orderbloc = context.read<OrderproductBloc>();
    return BlocBuilder<OrderproductBloc, OrderproductState>(
      builder: (context, state) {
        if (state is OrderState) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SvgPicture.asset("assets/home_/fres.svg"),
                      ),
                    ],
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: SvgPicture.asset("assets/home_/appicon.svg"),
                      ),
                    ),
                    expandedHeight: 240,
                    flexibleSpace: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/home_/rest.jpg"))),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 7,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                          ),
                        ),
                      ],
                    )),
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.postmen!.title.ru.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff2B2A28),
                                    fontWeight: FontWeight.w600),
                              ),
                              Gap(12),
                              const Text(
                                "Своим именем чайханский плов обязан старой ташкентской традиции «ош», когда мужчины собираются по четвергам в чайхане собственно «на ош», что означает «на плов».",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff858585),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Размер*",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff2B2A28),
                                    fontWeight: FontWeight.w600),
                              ),
                              Gap(12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              orderbloc.add(DecrementEvent());
                                            },
                                            child: const Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Color(0xff24292E),
                                                  fontSize: 20),
                                            )),
                                        Text(
                                          state.price.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff141414)),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              orderbloc.add(IncrementEvent());
                                            },
                                            child: const Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Color(0xff24292E),
                                                  fontSize: 20),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    (state.postmen!.outPrice * state.price)
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Gap(24),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width,
                                          52),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () async {
                                    HiveProduct mData = hiveModel(state,state.price);

                                    final moviesBox = HiveBox.getbox();
                                    await moviesBox.put(mData.id, mData,);
                                  
                                    //orderbloc.add(AddProduct(product: mData));
                                  },
                                  child: const Text(
                                    "Добавить в корзину ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
