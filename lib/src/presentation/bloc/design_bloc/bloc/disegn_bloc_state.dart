part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocState extends Equatable {
  const DisegnBlocState();

  @override
  List<Object> get props => [];
}

class DisegnBlocInitial extends DisegnBlocState {}

class DisegnState extends DisegnBlocState {
  List? isActiv;
  int activIcon;
  DisegnModel? branch;
  double latitude;
  double longitude;
  DisegnState(
      {required this.isActiv, required this.activIcon, required this.branch,required this.latitude,required this.longitude});
  DisegnState copyWith({List? isActiv, int? activIcon, DisegnModel? branch ,double? latitude,double? longitude}) {
    return DisegnState(
        branch: branch ?? this.branch,
        isActiv: isActiv ?? this.isActiv,
        activIcon: activIcon ?? this.activIcon,
        latitude: latitude?? this.latitude,
        longitude: longitude ?? this.longitude);
  }
}
