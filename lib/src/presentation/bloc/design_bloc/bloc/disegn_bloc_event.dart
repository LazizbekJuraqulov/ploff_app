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

class PaymentEvent extends DisegnBlocEvent{
   int indexPay;
  List? activList;
  
  PaymentEvent(
    this.indexPay,{this.activList}
  );
}
class OfficeEvent extends DisegnBlocEvent{
   int indexOff
   ;
  List? activList;
  
  OfficeEvent(
    this.indexOff
    ,{this.activList}
  );
}
