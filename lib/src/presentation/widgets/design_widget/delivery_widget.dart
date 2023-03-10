import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/button_order.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/check_widget.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/maps_widget.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/payment_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({
    Key? key,
    required this.disegnbloc,
  }) : super(key: key);

  final DisegnBlocBloc disegnbloc;

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  List list = ["Да", "Нет"];
  List time = ["Срочная доставка", "Доставка по расписанию"];
  List timeicons = ["assets/home_/cars.png", "assets/home_/time.png"];
  final List<MapObject> mapObjects = [];
  YandexMapController? _mapController;
  final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  final MapObjectId mapObjectWithDynamicIconId =
      MapObjectId('dynamic_icon_placemark');
  final MapObjectId mapObjectWithCompositeIconId =
      MapObjectId('composite_icon_placemark');
  Widget build(BuildContext context) {
    return BlocBuilder<DisegnBlocBloc, DisegnBlocState>(
      builder: (context, state) {
        if (state is DisegnState) {
          return Stack(
            children: [
              ListView(children: [
                MapsWidget(),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text("Хотели бы что бы вам позвонил курьер?",
                            style: textStyle),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                widget.disegnbloc.add(ActivIconEvent(index));
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 14, bottom: 14),
                                    child: state.isactivList![index]
                                        ? SvgPicture.asset(
                                            "assets/home_/activ_.svg")
                                        : SvgPicture.asset(
                                            "assets/home_/not_activ_.svg"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, bottom: 12, top: 12),
                                    child: Text(list[index], style: textindex),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: 2)
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
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Время доставка",
                          style: textStyle,
                        ),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                widget.disegnbloc.add(OfficeEvent(index));
                              },
                              child: ListTile(
                                leading: Image.asset(timeicons[index]),
                                title: Text(
                                  time[index].toString(),
                                  style: textOrder,
                                ),
                                trailing: state.isOffList![index]
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
                          itemCount: time.length),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text("Выберите время", style: textStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          width: 180,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/home_/clock.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("12:30"),
                              SizedBox(
                                width: 60,
                              ),
                              SvgPicture.asset("assets/home_/right.svg"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                PaymentWidget(disegnbloc: widget.disegnbloc, state: state),
                check(),
                Gap(100),
              ]),
             ButtonWidget()
            ],
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
