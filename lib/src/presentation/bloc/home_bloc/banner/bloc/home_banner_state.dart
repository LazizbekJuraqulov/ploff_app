part of 'home_banner_bloc.dart';

@immutable
abstract class HomeBannerState {}

class HomeBannerInitial extends HomeBannerState {}

class Loading extends HomeBannerState {
  List tolBool;
  int activIndex;
  Loading({required this.tolBool, required this.activIndex});
}
