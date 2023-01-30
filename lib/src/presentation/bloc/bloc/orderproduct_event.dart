part of 'orderproduct_bloc.dart';

@immutable
abstract class OrderproductEvent {}

class OrderProduct extends OrderproductEvent {
  String? text;
  OrderProduct(this.text);
}

class IncrementEvent extends OrderproductEvent {}

class DecrementEvent extends OrderproductEvent {}

class InitilEvent extends OrderproductEvent {}

// class LoadProduct extends OrderproductEvent {}

// class UpdateProduct extends OrderproductEvent {
//   final HiveProduct product;

//   UpdateProduct({required this.product});
//   @override
//   List<Object?> get props => [product];
// }
class AddProduct extends OrderproductEvent {
  HiveProduct product;

  AddProduct({required this.product});
}

class DeleteProduct extends OrderproductEvent {
  String product;
  DeleteProduct({required this.product});
}

class DeleteAllProduct extends OrderproductEvent {
  
}
