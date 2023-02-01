import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';

Container check() {
    return Container(
                margin: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12)),
                child: ValueListenableBuilder(
                  valueListenable: HiveBox.getbox().listenable(),
                  builder: (context, Box<HiveProductModel> box, _) {
                    final hivedata = HiveDataBase.getProduct(box);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const Padding(
                          padding:  EdgeInsets.only(
                              left: 16, top: 16, bottom: 8),
                          child: Text(
                            "Чек",
                            style: textStyle
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: hivedata.length,
                          itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(hivedata[index].title.toString()),
                            trailing: Text("${hivedata[index].outPrice * int.parse(hivedata[index].count)} сум"),
                          );
                        })
                      ],
                    );
                  },
                ),
              );
  }