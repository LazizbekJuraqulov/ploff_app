import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductOrder extends StatefulWidget {
  const ProductOrder({super.key});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  @override
  Widget build(BuildContext context) {
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
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: SvgPicture.asset("assets/home_/appicon.svg"),
              ),
              expandedHeight: 240,
              floating: false,
              pinned: false,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/home_/rest.jpg"))),
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
                    "Плов",
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
          ),
          SliverGap(85),
          SliverToBoxAdapter(
            child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Color(0xff24292E), fontSize: 15),
                                )),
                            Text("1"),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Color(0xff24292E), fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                      Text("20000"),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 52),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
