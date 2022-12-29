import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_banner_event.dart';
part 'home_banner_state.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  HomeBannerBloc() : super(HomeBannerInitial()) {
    on<HomeBannerEvent>((event, emit) {});
    on<HomeInit>((event, emit) {
      emit(
          Loading(tolBool: List.generate(10, (index) => false), activIndex: 0));
    });
    on<PageIndex>((event, emit) {
      final state = this.state as Loading;
      emit(Loading(tolBool:state.tolBool, activIndex: event.activIndex));
    });
  }
}
