import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/bloc/orderproduct_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/basket_widget/basket_count.dart';

class BasketisNotEmpty extends StatelessWidget {
  const BasketisNotEmpty({
    Key? key,
    required this.orderBloc,
  }) : super(key: key);

  final OrderproductBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderproductBloc, OrderproductState>(
      builder: (context, state) {
        if (state is OrderState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: HiveBox.getbox().listenable(),
                builder: (context, Box<HiveProductModel> box, _) {
                  final data = HiveDataBase.getProduct(box);
                  return Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/home_/123.jpg")),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              Container(
                                width: 200,
                                height: 88,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data[index].title),
                                        Text(
                                            "${data[index].outPrice * int.parse(data[index].count)} сум"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () async {
                                              alertwidget(context, data, index,
                                                  orderBloc);
                                            },
                                            child: SvgPicture.asset(
                                                "assets/home_/delete.svg")),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(width: 0.5)),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    var counter = int.parse(
                                                        data[index].count);
                                                    if (counter > 1) {
                                                      counter--;
                                                      box.put(
                                                          data[index].id,
                                                          data[index].copyWith(
                                                              count: counter
                                                                  .toString()));
                                                    }
                                                  },
                                                  icon: Icon(Icons.remove)),
                                              Text(
                                                  data[index].count.toString()),
                                              IconButton(
                                                  onPressed: () {
                                                    var counter = int.parse(
                                                        data[index].count);
                                                    counter++;
                                                    box.put(
                                                        data[index].id,
                                                        data[index].copyWith(
                                                            count: counter
                                                                .toString()));
                                                  },
                                                  icon: Icon(Icons.add)),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: data.length),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 52),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.pushNamed(context, "design");
                    },
                    child: Text(
                      "Оформить заказ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000)),
                    )),
              )
            ],
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
