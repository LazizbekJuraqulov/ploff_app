import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';

Future<dynamic> alertwidget(BuildContext context, List<HiveProductModel> data,
    int index, OrderproductBloc orderBloc) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.only(bottom: 16),
        contentPadding: EdgeInsets.only(left: 16,right: 16),
          
          title:const Padding(
            padding:  EdgeInsets.only(left: 18,right: 18),
            child:  Text(
              "Очистить корзину?",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff0000000),
                  fontWeight: FontWeight.w600),
            ),
          ),
          content: const Padding(
          
            padding: EdgeInsets.all(16),
            child: Text("Вы уверены, что хотите очистить корзину?",style: TextStyle(color: Color(0xff858585),fontSize: 15,fontWeight: FontWeight.w400),),
          ),
          actions: [
             InkWell(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Container(
                   padding: EdgeInsets.only(
                       left: 40, top: 14, right: 40, bottom: 14),
                   decoration: BoxDecoration(
                       color: Color(0xffF2F2F2),
                       borderRadius: BorderRadius.circular(8)),
                   child: const Text(
                     "Нет",
                     style: TextStyle(
                         fontSize: 15,
                         color: Color(0xff0000000),
                         fontWeight: FontWeight.w600),
                   ),
                 )),
                  const SizedBox(
               width: 12,
             ),
                  InkWell(
                 onTap: () async{
                   orderBloc.add(DeleteProduct(product: data[index].id));
                   Navigator.pop(context);
                 },
                 child: Container(
                   padding: EdgeInsets.only(
                       left: 40, top: 14, right: 40, bottom: 14),
                   decoration: BoxDecoration(
                       color: Color(0xffF5C109),
                       borderRadius: BorderRadius.circular(8)),
                   child: const Text(
                     "Да",
                     style: TextStyle(
                         fontSize: 15,
                         color: Color(0xff0000000),
                         fontWeight: FontWeight.w600),
                   ),
                 )),
          ],
        );
      });
}
