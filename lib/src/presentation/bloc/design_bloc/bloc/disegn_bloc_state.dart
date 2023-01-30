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
  DisegnState({required this.isActiv, required this.activIcon});
  DisegnState copyWith({List? isActiv, int? activIcon}) {
    return DisegnState(
        isActiv: isActiv ?? this.isActiv,
        activIcon: activIcon ?? this.activIcon);
  }
}
