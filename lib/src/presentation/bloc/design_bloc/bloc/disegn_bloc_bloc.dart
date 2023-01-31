import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff_app/src/data/datasourse/remote/design_api.dart';
import 'package:ploff_app/src/data/dto/design_model.dart';

part 'disegn_bloc_event.dart';
part 'disegn_bloc_state.dart';

class DisegnBlocBloc extends Bloc<DisegnBlocEvent, DisegnBlocState> {
  DisegnBlocBloc() : super(DisegnBlocInitial()) {
    on<DisegnBlocEvent>((event, emit) {});
    on<DisegnnEvent>((event, emit) async{
      final branchs = await DesignApi.disegn();
      emit(DisegnState(
        isActiv: List.generate(5, (index) => false),
        activIcon: 0,
        branch: branchs
      ));
    });
    on<ActivIconEvent>((event, emit) {
      final state = this.state as DisegnState;
      state.isActiv![event.activIcon] = true;
      emit(state.copyWith(isActiv: state.isActiv, activIcon: state.activIcon));
    });
  }
}
