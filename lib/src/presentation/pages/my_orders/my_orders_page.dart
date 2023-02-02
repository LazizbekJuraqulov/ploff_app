import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/presentation/bloc/my_orders/bloc/my_orders_bloc.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, MyOrdersState>(builder: (context, state) {
      if (state is MyOrderState) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            centerTitle: true,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            title: const Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, bottom: 17),
              child: Text(
                "Мои заказы",
                style: TextStyle(fontSize: 20, color: Color(0xff000000)),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(400, 32),
              child: Padding(
                padding: EdgeInsets.only(left: 13, bottom: 12, right: 19),
                child: Container(
                  height: 46,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xfff5f5f5),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      
                      indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(6.96), // Creates border
                        color: Colors.white ,
                      ),
                      unselectedLabelStyle: TextStyle(color: Color(0xff858585)),
                      tabs: const [
                        Text(
                          "Активные заказы",
                          style: TextStyle(fontSize: 15, color:Color(0xff2B2A28),fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "История заказов",
                          style: TextStyle(fontSize: 15, color: Color(0xff2B2A28),fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          body: TabBarView(controller: _tabController, children: [
            //isEmptyWidget(),
            Container(
              child: ListView.builder(
                  itemCount: state.orders.orders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Заказ №789",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xff0000000)),),
                            Container(
                              padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(14, 115, 246, 0.1)
                              ),
                              child: Text("Готовится",style:TextStyle(fontSize: 15,color: Color(0xff0E73F6)),),
                            )
                          ],),
                          Gap(24),
                          Row(children: [
                            SvgPicture.asset("assets/home_/zakaz.svg"),
                            Container(width: 34,height: 1.66,color: Color(0xffF5C109),),
                             SvgPicture.asset("assets/home_/zakaz1.svg"),
                             Container(width: 34,height: 1.66,color: Color(0xffffffff),),
                              SvgPicture.asset("assets/home_/zakaznoactiv.svg"),
                              Container(width: 34,height: 1.66,color: Color(0xffffffff),),
                               SvgPicture.asset("assets/home_/zakaz4noactiv.svg")
                          ],)
                        ],
                      ),
                    );
                  }),
            ),
            CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.only(
                          top: 12, left: 16, right: 16, bottom: 14),
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Заказ №124",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 16, right: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromRGBO(34, 195, 72, 0.1)),
                                child: Text(
                                  "Доставлен",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff22C348),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "85 000 сум",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff5F5F5F),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/home_/svges.svg"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "11.05.2022",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff858585),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: 3))
              ],
            )
          ]),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}

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
