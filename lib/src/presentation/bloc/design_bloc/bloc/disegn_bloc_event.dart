part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocEvent extends Equatable {
  const DisegnBlocEvent();

  @override
  List<Object> get props => [];
}

class DisegnnEvent extends DisegnBlocEvent {}

class ActivIconEvent extends DisegnBlocEvent {
  int activIcon;
  ActivIconEvent(
    this.activIcon,
  );
}
