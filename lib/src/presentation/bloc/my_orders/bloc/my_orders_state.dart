part of 'my_orders_bloc.dart';

@immutable
abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class MyOrderState extends MyOrdersState {
  GetOrderModel orders;
  MyOrderState({required this.orders});
}
