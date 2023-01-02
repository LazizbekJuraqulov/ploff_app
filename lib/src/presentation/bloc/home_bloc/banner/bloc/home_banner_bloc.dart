import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/remote/home_api_maneger.dart';
import 'package:ploff_app/src/data/dto/home_product_model.dart';
import 'package:ploff_app/src/data/respository/respository.dart';
import 'package:ploff_app/src/domain/entites/product_entites.dart';
import 'package:ploff_app/src/domain/usercase/product_usercase.dart';

part 'home_banner_event.dart';
part 'home_banner_state.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  HomeBannerBloc() : super(HomeBannerInitial()) {
    on<HomeBannerEvent>((event, emit) {});
    on<HomeInit>((event, emit) async {
      if (state is HomeBannerInitial) {
        dynamic data = await PloffApi.productApi();
        

        emit(Loading(
            tolBool: List.generate(10, (index) => false),
            activIndex: 0,
            posts: data,
            pageKey: 1));
        print(data.toString());
      }
    });
    on<PageIndex>((event, emit) {
      final state = this.state as Loading;
      emit(Loading(
          tolBool: state.tolBool,
          activIndex: event.activIndex,
          posts: [],
          pageKey: 0));
    });
    on<ActivePage>((event, emit) {
      final state = this.state as Loading;
      state.tolBool[event.activIndex] = !state.tolBool[event.activIndex];
      emit(Loading(
          tolBool: state.tolBool,
          activIndex: state.activIndex,
          pageKey: 0,
          posts: []));
    });
  }
}
