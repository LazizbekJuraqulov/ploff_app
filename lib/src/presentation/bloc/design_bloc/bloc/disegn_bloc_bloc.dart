import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'disegn_bloc_event.dart';
part 'disegn_bloc_state.dart';

class DisegnBlocBloc extends Bloc<DisegnBlocEvent, DisegnBlocState> {
  DisegnBlocBloc() : super(DisegnBlocInitial()) {
    on<DisegnBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
