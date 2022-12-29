import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenEvent>((event, emit) {});
    on<NavigateToHomeScreenEvent>((event, emit) async {
      emit(Loading());

      await Future.delayed(Duration(seconds: 3));

      emit(Loaded());
    });
  }
}
