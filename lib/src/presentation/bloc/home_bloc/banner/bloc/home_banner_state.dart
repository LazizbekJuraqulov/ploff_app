part of 'home_banner_bloc.dart';

@immutable
abstract class HomeBannerState {}

class HomeBannerInitial extends HomeBannerState {}

class Looading extends HomeBannerState {
  List? tolBool;
  int activIndex;
  List<ProductEntity> data;
  BannersModel banners;
  int page;

  Looading(
      {required this.tolBool,
      required this.activIndex,
      required this.data,
      required this.banners,
      required this.page});
}
