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
          activIconIndex: 0,
          branch: branchs,
          latitude: 41.311081,
          longitude: 69.240562));
    });
    on<ActivIconEvent>((event, emit) {
      final state = this.state as DisegnState;
      state.isactivList![event.activIconIndex] = true;
      emit(state.copyWith(isactivList: state.isactivList, activIconIndex: event.activIconIndex));
    });
    on<LocaltionEvent>((event, emit)async {
      final state = this.state as DisegnState;
      //final branchs = await DesignApi.disegn();

      emit(state.copyWith(latitude: state.branch!.branches[event.localtion].location.lat,longitude: state.branch!.branches[event.localtion].location.long));
    });
  }
}
