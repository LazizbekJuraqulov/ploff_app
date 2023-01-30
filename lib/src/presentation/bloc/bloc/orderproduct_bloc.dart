import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/local/detelApi.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_box.dart';
import 'package:ploff_app/src/data/datasourse/local/hive_class.dart';
import 'package:ploff_app/src/data/dto/hive_product_model.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';
import 'package:ploff_app/src/data/dto/detel_product_model.dart';

part 'orderproduct_event.dart';
part 'orderproduct_state.dart';

class OrderproductBloc extends Bloc<OrderproductEvent, OrderproductState> {
  OrderproductBloc() : super(OrderproductInitial()) {
    on<OrderproductEvent>((event, emit) {});

    on<InitilEvent>((event, emit) {
      emit(OrderState(price: 1));
    });
    on<OrderProduct>((event, emit) async {
      final states = await DetelApi.productHive(event.text!);
      emit(OrderState(postmen: states, price: 1));
    });
    on<IncrementEvent>((event, emit) {
      final state = this.state as OrderState;

      emit(state.copyWith(
        price: state.price + 1,
      ));
    });
    on<DecrementEvent>((event, emit) {
      final state = this.state as OrderState;
      if (state.price > 1) {
        emit(state.copyWith(price: state.price - 1));
      }
    });

    // on<LoadProduct>((event, emit) async {
    //   final state = this.state as OrderState;
    //   Box box = await hiveDataBase.openBox();
    //   List<IdProduct> product = hiveDataBase.getProduct(box);
    //   emit(state.copyWith(listProduct: product));
    // });
    // on<UpdateProduct>((event, emit) async {
    //   final state = this.state as OrderState;
    //   Box box = await hiveDataBase.openBox();
    //   if (state is OrderState) {
    //     await hiveDataBase.updateProduct(box, event.product);
    //     emit(state.copyWith(listProduct: hiveDataBase.getProduct(box)));
    //   }
    // });
    on<AddProduct>((event, emit) async {
      final state = this.state as OrderState;
      final hivedabase = HiveDataBase();
      Box box = await HiveBox.getbox();
      if (state is OrderState) {
        await hivedabase.addProduct(box, event.product);
        // emit(state.copyWith(hivedata: hivedabase.getProduct(box)));
      }
    });
    on<DeleteProduct>((event, emit) async {
      final state = this.state as OrderState;
      final box = await HiveBox.getbox().delete(event.product);

      emit(state.copyWith());
    });

    on<DeleteAllProduct>((event, emit) async {
      final state = this.state as OrderState;
      final box = await HiveBox.getbox().clear();
      emit(state.copyWith());
    });
  }
}
