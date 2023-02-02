import 'package:flutter/material.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';

Future<dynamic> alertwidget(BuildContext context, List<HiveProductModel> data, int index,OrderproductBloc orderBloc ) {
    return showDialog(
                                                  context: context,
                                                  builder: (context) { 
                                                    return AlertDialog(
                                                       title: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            "Очистить корзину?",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Color(
                                                                    0xff0000000),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .only(
                                                                    left: 20,
                                                                    right: 20
                                                                    ),
                                                            child: Text(
                                                              "Вы уверены, что хотите очистить корзину?",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15,
                                                                  color: Color(
                                                                      0xff858585),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      content: Container(
                                                        padding: EdgeInsets.only(left: 8,right: 8),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xffF2F2F2),
                                                                    minimumSize:
                                                                        Size(
                                                                            100,
                                                                            52),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            8))),
                                                                onPressed:
                                                                    () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Нет",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Color(
                                                                          0xff0000000),
                                                                      fontWeight:
                                                                          FontWeight.w600),
                                                                )),
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                            ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                    minimumSize:
                                                                        Size(
                                                                            100,
                                                                            52),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            8))),
                                                                onPressed:
                                                                    () async {
                                                                  orderBloc.add(DeleteProduct(
                                                                      product:
                                                                          data[index].id));
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Да",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: Color(
                                                                          0xff0000000),
                                                                      fontWeight:
                                                                          FontWeight.w600),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
  }
