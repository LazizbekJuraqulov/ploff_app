part of 'orderproduct_bloc.dart';

@immutable
abstract class OrderproductEvent {}

class OrderProduct extends OrderproductEvent {
  String? text;
  OrderProduct(this.text);
}
class IncrementEvent extends OrderproductEvent {
  
}
class DecrementEvent extends OrderproductEvent {
  
}