import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_app/src/data/datasourse/local/hive.dart';
import 'package:ploff_app/src/data/datasourse/remote/banner_api_maneger.dart';
import 'package:ploff_app/src/data/datasourse/remote/product_api_maneger.dart';
import 'package:ploff_app/src/data/dto/banners_model.dart';
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
      final respon = await GetProduct(ProductRepo()).call();
      final banner = await BannersApi.productApi();
    

      emit(Looading(
          tolBool: List.generate(10, (index) => false),
          activIndex: 0,
          data: respon,
          banners: banner,
          page: 0,
          ));
    });
    on<PageIndex>((event, emit) {
      final state = this.state as Looading;

      emit(Looading(
          tolBool: state.tolBool,
          activIndex: event.index,
          data: state.data,
          banners: state.banners,
          page: state.page));
    });
    on<ActivePage>((event, emit) {
      final state = this.state as Looading;
      state.tolBool![event.activIndex] = !state.tolBool![event.activIndex];

      emit(Looading(
          tolBool: state.tolBool,
          activIndex: state.activIndex,
          data: state.data,
          banners: state.banners,
          page: state.page));
    });
  }
}
