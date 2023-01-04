import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        title: Text(
          "Корзина",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000)),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(child: SvgPicture.asset("assets/home_/basket.svg")),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/home_/fil.png"),
              SizedBox(height: 24,),
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
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                alignment: Alignment.center,
                height: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffFFCC00)),
                child:const Text(
                  "+ Добавить продукт",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
