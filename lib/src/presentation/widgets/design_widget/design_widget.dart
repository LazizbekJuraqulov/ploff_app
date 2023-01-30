import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/delivery_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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

  List list = ["Да", "Нет"];

  @override
  Widget build(BuildContext context) {
    final disegnbloc = context.read<DisegnBlocBloc>();
    return BlocBuilder<DisegnBlocBloc, DisegnBlocState>(
        builder: (context, state) {
      if (state is DisegnState) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
                        borderRadius:
                            BorderRadius.circular(6.96), // Creates border
                        color: Colors.white,
                      ),
                      tabs: const [
                        Text(
                          "Доставка",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff2B2A28)),
                        ),
                        Text(
                          "Самовывоз",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff2B2A28)),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          body: TabBarView(controller: tabController, children: [
            DeliveryPage(disegnbloc: disegnbloc, list: list),
            Container(
              child: ListView(children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ближайший филиал",
                        style: TextStyle(fontSize: 17),
                      ),
                      Gap(16),
                      Container(
                        height: 156,
                        child: YandexMap(),
                      ),
                      //Gap(16),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset("assets/img/filial.png"),
                              title: Text("xcvvfds"),
                              subtitle: Text("sfadgsdfbfd"),
                              trailing: state.isActiv![index]
                                  ? SvgPicture.asset("assets/home_/activ_.svg")
                                  : SvgPicture.asset(
                                      "assets/home_/not_activ_.svg"),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 2),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Тип оплаты",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2B2A28)),
                        ),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                disegnbloc.add(ActivIconEvent(index));
                              },
                              child: ListTile(
                                leading: Icon(Icons.access_alarm),
                                title: Text("Наличные"),
                                trailing: state.isActiv![index]
                                    ? SvgPicture.asset(
                                        "assets/home_/activ_.svg")
                                    : SvgPicture.asset(
                                        "assets/home_/not_activ_.svg"),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 3),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Чек",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2B2A28)),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text("Свадебный плов х2"),
                                trailing: Text("10 000 сум"));
                          },
                          itemCount: 3),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        );
      } else {
        return Scaffold();
      }
    });
  }
}


