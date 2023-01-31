import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({
    Key? key,
    required this.disegnbloc,
    required this.list,
  }) : super(key: key);

  final DisegnBlocBloc disegnbloc;
  final List list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisegnBlocBloc, DisegnBlocState>(
      builder: (context, state) {
        if (state is DisegnState) {
          return Stack(
            children: [
              ListView(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
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
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Квартира",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff858585),
                                fontWeight: FontWeight.w400),
                            fillColor: const Color(0xffF5F5F5),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFCC00)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Gap(8),
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width * 0.29,
                              child: TextField(
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Квартира",
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff858585),
                                      fontWeight: FontWeight.w400),
                                  fillColor: const Color(0xffF5F5F5),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFFCC00)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
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
                        // child: YandexMap(),
                      ),
                     
                      
                      Text("Мои адреса"),
                      SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          style: const TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Квартира",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff858585),
                                fontWeight: FontWeight.w400),
                            fillColor: const Color(0xffF5F5F5),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFFCC00)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Хотели бы что бы вам позвонил курьер?",
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 14, bottom: 14),
                                    child: state.isActiv![index]
                                        ? SvgPicture.asset(
                                            "assets/home_/activ_.svg")
                                        : SvgPicture.asset(
                                            "assets/home_/not_activ_.svg"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12, bottom: 12, top: 12),
                                    child: Text(
                                      list[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff000000)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Время доставка",
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
                          itemCount: 2),
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                        child: Text(
                          "Выберите время",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff2B2A28)),
                        ),
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
                SizedBox(
                  height: 100,
                ),
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
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 52),
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
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
