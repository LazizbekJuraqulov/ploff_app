import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_app/src/data/datasourse/remote/design_api.dart';
import 'package:ploff_app/src/data/dto/design_model.dart';

part 'disegn_bloc_event.dart';
part 'disegn_bloc_state.dart';

class DisegnBlocBloc extends Bloc<DisegnBlocEvent, DisegnBlocState> {
  DisegnBlocBloc() : super(DisegnBlocInitial()) {
    on<DisegnBlocEvent>((event, emit) {});
    on<DisegnnEvent>((event, emit) async {
      final branchs = await DesignApi.disegn();
      emit(DisegnState(
          isactivList: List.generate(10, (index) => false),
           isOffList: List.generate(10, (index) => false),
            isPayList: List.generate(10, (index) => false),
            isLocList: List.generate(10, (index) => false),

          activIconIndex: 0,
          branch: branchs,
          latitude: 41.311081,
          longitude: 69.240562));
    });
    on<ActivIconEvent>((event, emit) {
      final state = this.state as DisegnState;
      for (var i = 0; i < state.isactivList!.length; i++) {
        if (i == event.activIconIndex) {
          state.isactivList![i] = true;
        } else {
          state.isactivList![i] = false;
        }
      }
      emit(state.copyWith(
          isactivList: state.isactivList,
          activIconIndex: event.activIconIndex));
    });
    on<LocaltionEvent>((event, emit) async {
      final state = this.state as DisegnState;
         for (var i = 0; i < state.isLocList!.length; i++) {
        if (i == event.localtion) {
          state.isactivList![i] = true;
        } else {
          state.isactivList![i] = false;
        }
      }

      emit(state.copyWith(
          latitude: state.branch!.branches[event.localtion].location.lat,
          longitude: state.branch!.branches[event.localtion].location.long,
          isactivList: state.isLocList,
          activIconIndex: event.localtion));
    });
     on<PaymentEvent>((event, emit) {
      final state = this.state as DisegnState;
      for (var i = 0; i < state.isPayList!.length; i++) {
        if (i == event.indexPay) {
          state.isPayList![i] = true;
        } else {
          state.isPayList![i] = false;
        }
      }
      emit(state.copyWith(
          isPayList: state.isPayList,
          activIconIndex: event.indexPay));
    });
     on<OfficeEvent>((event, emit) {
      final state = this.state as DisegnState;
      for (var i = 0; i < state.isOffList!.length; i++) {
        if (i == event.indexOff) {
          state.isOffList![i] = true;
        } else {
          state.isOffList![i] = false;
        }
      }
      emit(state.copyWith(
          isOffList: state.isOffList,
          activIconIndex: event.indexOff));
    });
  }
}

