import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: const EdgeInsets.only(top: 12, left: 16, bottom: 17),
          child: Text(
            "Оформить заказ",
            style: TextStyle(fontSize: 17, color: Color(0xff000000)),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/svg_icons/close.svg"),
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
                  controller: tabController,
                  unselectedLabelStyle: TextStyle(color: Color(0xffffffff)),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.96), // Creates border
                    color: Colors.white,
                  ),
                  tabs: const [
                    Text(
                      "Доставка",
                      style: TextStyle(fontSize: 15, color: Color(0xff2B2A28)),
                    ),
                    Text(
                      "Самовывоз",
                      style: TextStyle(fontSize: 15, color: Color(0xff2B2A28)),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      body: TabBarView(
        
        controller: tabController, children: [
        ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 16, bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Адрес доставки",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2B2A28)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Текущий адрес",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff5F5F5F)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.only(left: 16, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Бешкайрагач 12",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2B2A28)),
                  ),
                ),
                Container(
                  height: 48,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 109,
                        height: 48,
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.only(left: 16, top: 12, bottom: 12),
                        decoration: BoxDecoration(
                            color: Color(0xfff5f5f5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Подъезд",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff858585)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 156,
                  color: Colors.red,
                )
              ],
            ),
          )
        ]),
        Container(),
      ]),
    );
  }
}
