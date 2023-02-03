part of 'orderproduct_bloc.dart';

@immutable
abstract class OrderproductState {}

class OrderproductInitial extends OrderproductState {}

class OrderState extends OrderproductState {
  IdProduct? postmen;
  int price = 1;
  List<HiveProductModel>? hivedata;
  bool? isTrue;
  OrderState({this.postmen, required this.price, this.hivedata,this.isTrue});

  OrderState copyWith({

    IdProduct? postmen,
    int price = 1,
    List<HiveProductModel>? hivedata,
    bool? isTrue
  }) {
    return OrderState(
      postmen: postmen ?? this.postmen,
      price: price,
      hivedata: hivedata ?? this.hivedata,
      isTrue: isTrue ?? this.isTrue
    );
  }
}
