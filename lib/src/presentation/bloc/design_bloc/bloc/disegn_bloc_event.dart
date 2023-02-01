part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocEvent  {
  const DisegnBlocEvent();

  @override
  List<Object> get props => [];
}

class DisegnnEvent extends DisegnBlocEvent {}

class ActivIconEvent extends DisegnBlocEvent {
  int activIconIndex;
  List? activList;
  
  ActivIconEvent(
    this.activIconIndex,{this.activList}
  );
}

class LocaltionEvent extends DisegnBlocEvent {
  int localtion;
  LocaltionEvent({required this.localtion});
}
