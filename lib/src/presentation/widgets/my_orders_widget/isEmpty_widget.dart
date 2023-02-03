import 'package:flutter/material.dart';

class isEmptyWidget extends StatelessWidget {
  const isEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SizedBox(),
            ],
          ),
          Column(
            children: [
              Image.asset("assets/home_/orders.png"),
              SizedBox(
                height: 32,
              ),
              Text("У вас нет активных заказов")
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/insta.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/img/teg.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/img/facbook.png"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
