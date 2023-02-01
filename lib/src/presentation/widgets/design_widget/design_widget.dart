import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/check_widget.dart';
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
   late YandexMapController _controller;

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
            Stack(
              children: [
                ListView(children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
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
                          child: YandexMap(
                              onMapCreated: (YandexMapController controller)async {
                           _controller = controller;
                          await  controller.moveCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: Point(
                                        latitude: state.latitude,
                                        longitude: state.longitude))));
                          }),
                        ),
                        //Gap(16),
                        SizedBox(
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    disegnbloc
                                        .add(LocaltionEvent(localtion: index));
                                   await _controller.moveCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: Point(
                                                    latitude: state
                                                        .branch!
                                                        .branches[index]
                                                        .location
                                                        .lat,
                                                    longitude: state
                                                        .branch!
                                                        .branches[index]
                                                        .location
                                                        .long))));
                                  },
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/img/filial.png"),
                                    title: Text(
                                        state.branch!.branches[index].name),
                                    subtitle: Text(
                                        state.branch!.branches[index].address),
                                    trailing: state.isActiv![index]
                                        ? SvgPicture.asset(
                                            "assets/home_/activ_.svg")
                                        : SvgPicture.asset(
                                            "assets/home_/not_activ_.svg"),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: 5),
                        ),
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
                        const Padding(
                          padding:
                          EdgeInsets.only(left: 16, top: 16, bottom: 8),
                          child: Text(
                            "Тип оплаты",
                            style: textStyle
                          ),
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                 check(),
                  Gap(100)
                ]),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          color: Color(0xffffffff),
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 16),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 52),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () {},
                              child: Text(
                                "Заказать",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000)),
                              )),
                        )
                      ],
                    )),
              ],
            ),
          ]),
        );
      } else {
        return Scaffold();
      }
    });
  }
}
