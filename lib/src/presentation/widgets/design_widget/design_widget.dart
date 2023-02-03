import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_app/src/constants/textStyle.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:ploff_app/src/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/button_order_widget.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/check_widget.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/delivery_widget.dart';
import 'package:ploff_app/src/presentation/widgets/design_widget/payment_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  TabController? tabController;

  late int activIndex;
  List<MapObject> mapObjects = [];
  late PlacemarkMapObject mapObject;
  final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  late YandexMapController _controller;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    mapObjects = [
      mapObject = PlacemarkMapObject(
        mapId: mapObjectId,
        point: Point(latitude: 41.311081, longitude: 69.240562),
        zIndex: 20,
        opacity: 1,
        isDraggable: false,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
              'assets/img/metka.png',
            ),
            rotationType: RotationType.noRotation,
          ),
        ),
      )
    ];

    super.initState();
  }

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
                        borderRadius: BorderRadius.circular(6.96),
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
            DeliveryPage(
              disegnbloc: disegnbloc,
            ),
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
                        const Text("Ближайший филиал", style: textStyle),
                        Gap(16),
                        Container(
                          height: 156,
                          child: YandexMap(
                              mapObjects: mapObjects,
                              onMapCreated:
                                  (YandexMapController controller) async {
                                _controller = controller;
                                controller.moveCamera(
                                    animation: MapAnimation(
                                        duration: 2.0,
                                        type: MapAnimationType.smooth),
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: Point(
                                                latitude: state.latitude,
                                                longitude: state.longitude))));
                              }),
                        ),
                        SizedBox(
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, activIndex) {
                                return InkWell(
                                  onTap: () async {
                                    await _controller.moveCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: Point(
                                                    latitude: state.latitude,
                                                    longitude:
                                                        state.longitude))));
                                    if (!mapObjects
                                        .any((el) => el.mapId == mapObjectId)) {
                                      return;
                                    }
                                    mapObjects[mapObjects.indexOf(mapObject)] =
                                        mapObject.copyWith(
                                            point: Point(
                                                latitude:
                                                    mapObject.point.latitude,
                                                longitude:
                                                    mapObject.point.longitude));

                                    final mapObjectw = PlacemarkMapObject(
                                      mapId: mapObjectId,
                                      point: Point(
                                          latitude: state.latitude,
                                          longitude: state.longitude),
                                      zIndex: 20,
                                      opacity: 1,
                                      isDraggable: false,
                                      icon: PlacemarkIcon.single(
                                        PlacemarkIconStyle(
                                          image:
                                              BitmapDescriptor.fromAssetImage(
                                            'assets/img/metka.png',
                                          ),
                                          rotationType: RotationType.noRotation,
                                        ),
                                      ),
                                    );

                                    disegnbloc.add(
                                      LocaltionEvent(localtion: activIndex),
                                    );
                                    mapObjects.add(mapObjectw);
                                  },
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/img/filial.png"),
                                    title: Text(state
                                        .branch!.branches[activIndex].name),
                                    subtitle: Text(state
                                        .branch!.branches[activIndex].address),
                                    trailing: state.isLocList![activIndex]
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
                  PaymentWidget(
                    disegnbloc: disegnbloc,
                    state: state,
                  ),
                  check(),
                  const Gap(100),
                  //Oformit(),
                ]),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                color: Color(0xffffffff),
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16, top: 16),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width,
                                            52),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    onPressed: () {
                                      // final bloc = context.read<NavbarBloc>();
                                      // bloc.add(MyOrderTransferEvent());
                                      // Navigator.pushNamedAndRemoveUntil(context,
                                      //     "navbar",context.read<NavbarBloc>().add(MyOrderTransferEvent()),);
                                          
                                    },
                                    child: const Text("Заказать",
                                        style: buttontext)),
                              )
                            ],
                          )),
              ],
            ),
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
