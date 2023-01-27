part of 'orderproduct_bloc.dart';

@immutable
abstract class OrderproductState {}

class OrderproductInitial extends OrderproductState {}

class OrderState extends OrderproductState {
  IdProduct? postmen;
  int price = 1;
  List<HiveProduct> ?hivedata;
  OrderState({
    this.postmen,
    required this.price,
    this.hivedata
  });

  OrderState copyWith({
    IdProduct? postmen,
    int price = 1,
    List<HiveProduct>? hivedata,
  }) {
    return OrderState(
      postmen: postmen ?? this.postmen,
      price: price,
      hivedata: hivedata ?? this.hivedata,
    );
  }
}
