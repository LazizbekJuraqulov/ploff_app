part of 'home_banner_bloc.dart';

@immutable
abstract class HomeBannerEvent {}

class HomeInit extends HomeBannerEvent {
  int activIndex;
  List toolBool;
  HomeInit({required this.activIndex, required this.toolBool});
}

class PageIndex extends HomeBannerEvent {
  int activIndex;
  PageIndex( this.activIndex);
}
