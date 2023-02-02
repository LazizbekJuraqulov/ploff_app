part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocState {
  const DisegnBlocState();

  @override
  List<Object> get props => [];
}

class DisegnBlocInitial extends DisegnBlocState {}

class DisegnState extends DisegnBlocState {
  List<bool>? isactivList;
  List<bool>? isOffList;
  List<bool>? isPayList;
  List<bool>? isLocList;
  int activIconIndex;
  DisegnModel? branch;
  double latitude;
  double longitude;
  DisegnState(
      {required this.isactivList,
      required this.activIconIndex,
      required this.branch,
      required this.latitude,
      required this.longitude,
      required this.isOffList,
      required this.isPayList,
      required this.isLocList});
  DisegnState copyWith(
      {List<bool>? isactivList,
      int? activIconIndex,
      DisegnModel? branch,
      double? latitude,
      double? longitude,
      List<bool>? isOffList,
      List<bool>? isPayList,
      List<bool>? isLocList}) {
    return DisegnState(
        branch: branch ?? this.branch,
        isactivList: isactivList ?? this.isactivList,
        activIconIndex: activIconIndex ?? this.activIconIndex,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isOffList: isOffList ?? this.isOffList,
        isPayList: isPayList ?? this.isPayList,
        isLocList: isLocList ?? this.isLocList);
  }
}
