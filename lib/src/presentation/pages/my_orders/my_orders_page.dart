import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> with TickerProviderStateMixin{
   late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        title: const Padding(
          padding: const EdgeInsets.only(left: 16,bottom: 17),
          child: Text("Мои заказы",style: TextStyle(fontSize: 20,color: Color(0xff000000)),),
        ),
        bottom: PreferredSize(preferredSize: Size(400,32),
        child: Padding(
        padding: EdgeInsets.only(left: 13,bottom: 12,right: 19),
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
                      borderRadius: BorderRadius.circular(6.96), // Creates border
                      color: Colors.white,
                    ),
              tabs: const[
                 Text(
                        "Активные заказы",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                  Text(
                        "История заказов",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      
            ]),

          ),
        ),),

      ),
    );
  }
}