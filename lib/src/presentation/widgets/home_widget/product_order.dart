import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/presentation/bloc/home_bloc/banner/bloc/home_banner_bloc.dart';
import 'package:hive/hive.dart';

class ProductOrder extends StatefulWidget {
  int narx;
  ProductOrder({required this.narx});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
      builder: (context, state) {
        if (state is Looading) {
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
                            decoration: BoxDecoration(
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
                            decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data[widget.narx].title!.ru.toString(),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff2B2A28),
                                    fontWeight: FontWeight.w600),
                              ),
                              Gap(12),
                              Text(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
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
                                            onPressed: () {},
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Color(0xff24292E),
                                                  fontSize: 20),
                                            )),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff141414)),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Color(0xff24292E),
                                                  fontSize: 20),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    state.data[widget.narx].outPrice.toString(),
                                    style: TextStyle(
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
                                    final _productBox = Hive.box("product_box");
                                    Future<void> _createItem(
                                        Map<String, dynamic> item) async {
                                      await _productBox.add(item);
                                      print("ishladi ${_productBox.length}");
                                    }

                                    _createItem({
                                      "title": state.data[widget.narx].title.toString(),
                                      "narx": state.data[widget.narx].outPrice.toString()
                                    });
                                    setState(() {});
                                  },
                                  child: Text(
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
