import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/local/hive.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';
import 'package:ploff_app/src/data/dto/idproduct.dart';

part 'orderproduct_event.dart';
part 'orderproduct_state.dart';

class OrderproductBloc extends Bloc<OrderproductEvent, OrderproductState> {
  OrderproductBloc() : super(OrderproductInitial()) {
    on<OrderproductEvent>((event, emit) {});
    on<OrderProduct>((event, emit) async {
      final states = await HiveProduct.productHive(event.text!);
      emit(OrderState(data: states, price: 1));
    });
    on<IncrementEvent>((event, emit) {
      final state = this.state as OrderState;

      emit(OrderState(price: (state.price + 1), data: state.data));
    });
    on<DecrementEvent>((event, emit) {
      final state = this.state as OrderState;
      if (state.price>1) {
        
      emit(OrderState(price: (state.price - 1), data: state.data));
      }
      

    });
  }
}
