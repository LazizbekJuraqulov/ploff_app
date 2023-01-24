part of 'orderproduct_bloc.dart';

@immutable
abstract class OrderproductState {}

class OrderproductInitial extends OrderproductState {}

class OrderState extends OrderproductState {
  IdProduct ? data;
  int price=1;
  OrderState({ this.data, required this.price});
  OrderState copyWith({
    IdProduct? data,
    int price=1,
  }){
    return OrderState(
      data: data ?? this.data,
      price: price
    );
  }
}




