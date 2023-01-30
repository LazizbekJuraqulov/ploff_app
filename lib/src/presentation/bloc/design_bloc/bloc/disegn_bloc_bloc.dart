
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'disegn_bloc_event.dart';
part 'disegn_bloc_state.dart';

class DisegnBlocBloc extends Bloc<DisegnBlocEvent, DisegnBlocState> {
  DisegnBlocBloc() : super(DisegnBlocInitial()) {
    on<DisegnBlocEvent>((event, emit) {});
    on<DisegnnEvent>((event, emit) {
      
      emit(DisegnState(
          isActiv: List.generate(5, (index) => false),activIcon: 0));
    });
    on<ActivIconEvent>((event, emit) {
      final state = this.state as DisegnState;
      state.isActiv![event.activIcon] =true;
      emit(state.copyWith(isActiv: state.isActiv, activIcon: state.activIcon));
    });
  }
}
