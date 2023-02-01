part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocState  {
  const DisegnBlocState();

  @override
  List<Object> get props => [];
}

class DisegnBlocInitial extends DisegnBlocState {}

class DisegnState extends DisegnBlocState {
  List<bool>? isactivList;
  int activIconIndex;
  DisegnModel? branch;
  double latitude;
  double longitude;
  DisegnState(
      {required this.isactivList, required this.activIconIndex, required this.branch,required this.latitude,required this.longitude});
  DisegnState copyWith({List<bool>? isactivList, int? activIconIndex, DisegnModel? branch ,double? latitude,double? longitude}) {
    return DisegnState(
        branch: branch ?? this.branch,
        isactivList: isactivList ?? this.isactivList,
        activIconIndex: activIconIndex ?? this.activIconIndex,
        latitude: latitude?? this.latitude,
        longitude: longitude ?? this.longitude);
  }
}
