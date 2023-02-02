import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/remote/to_order_api.dart';
import 'package:ploff_app/src/data/dto/to_order_model.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  MyOrdersBloc() : super(MyOrdersInitial()) {
    on<MyOrdersEvent>((event, emit) {});
    on<OrdersEvent>((event, emit)async {
      final dataOrders = await MyOrderApi.disegn();
      emit(MyOrderState(orders: dataOrders));
    });
  }
}
