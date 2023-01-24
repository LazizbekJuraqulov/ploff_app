import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
              child:
                  InkWell(child: SvgPicture.asset("assets/home_/basket.svg")),
            ),
          ],
        ),
       
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset("assets/home_/fil.png"),
        //         SizedBox(height: 24,),
        //         const Text(
        //           "В корзине пока нет продукты",
        //           style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //               color: Color(0xff5F5F5F)),
        //         )
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
        //           child: ElevatedButton(
        //             style:ElevatedButton.styleFrom(
        //               minimumSize: Size(MediaQuery.of(context).size.width, 52),
        //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        //             ),

        //             onPressed: (){}, child: Text("+ Добавить продукт",style:  TextStyle(
        //           fontSize: 15,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xff000000)),)),
        //         )
        //       ],
        //     )
        //   ],
        // ),
        );
  }
}
