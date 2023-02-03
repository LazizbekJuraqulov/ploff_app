import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_app/src/presentation/bloc/design_bloc/bloc/disegn_bloc_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class BranchWidget extends StatelessWidget {
  const BranchWidget({
    Key? key,
    required YandexMapController controller,
    required this.mapObjects,
    required this.mapObjectId,
    required this.mapObject,
    required this.disegnbloc,
    required this.state
  })  : _controller = controller,
        super(key: key);

  final YandexMapController _controller;
  final List<MapObject> mapObjects;
  final MapObjectId mapObjectId;
  final PlacemarkMapObject mapObject;
  final DisegnBlocBloc disegnbloc;
  final DisegnState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, activIndex) {
            return InkWell(
              onTap: () async {
                await _controller.moveCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: Point(
                            latitude: state.latitude,
                            longitude: state.longitude))));
                if (!mapObjects.any((el) => el.mapId == mapObjectId)) {
                  return;
                }
                mapObjects[mapObjects.indexOf(mapObject)] = mapObject.copyWith(
                    point: Point(
                        latitude: mapObject.point.latitude,
                        longitude: mapObject.point.longitude));

                final mapObjectw = PlacemarkMapObject(
                  mapId: mapObjectId,
                  point: Point(
                      latitude: state.latitude, longitude: state.longitude),
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
                );

                disegnbloc.add(
                  LocaltionEvent(localtion: activIndex),
                );
                mapObjects.add(mapObjectw);
              },
              child: ListTile(
                leading: Image.asset("assets/img/filial.png"),
                title: Text(state.branch!.branches[activIndex].name),
                subtitle: Text(state.branch!.branches[activIndex].address),
                trailing: state.isLocList![activIndex]
                    ? SvgPicture.asset("assets/home_/activ_.svg")
                    : SvgPicture.asset("assets/home_/not_activ_.svg"),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 5),
    );
  }
}
