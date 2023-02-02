import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  List<MapObject> mapObjects = [];
  late PlacemarkMapObject mapObject;
  final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  @override
  void initState() {
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.63,
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
          Gap(4),
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
            child: YandexMap(
              mapObjects: mapObjects,
              onMapCreated: (controller)async {
                controller.moveCamera(
                   animation:MapAnimation(duration: 2.0,type: MapAnimationType.smooth),
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: Point(
                            latitude: 41.311081,
                            longitude: 69.240562))));
              },
            ),
          ),
          Gap(16),
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
    );
  }
}