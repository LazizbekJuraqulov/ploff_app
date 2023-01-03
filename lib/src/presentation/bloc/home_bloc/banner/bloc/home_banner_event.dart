part of 'home_banner_bloc.dart';

@immutable
abstract class HomeBannerEvent {}

class HomeInit extends HomeBannerEvent {
  int? activIndex;
  List? toolBool;
  int? page;

  HomeInit({this.activIndex, this.toolBool,this.page});
}

// ignore: must_be_immutable
class PageIndex extends HomeBannerEvent {
  int index;
  PageIndex(this.index);
}

class ActivePage extends HomeBannerEvent {
  int activIndex = 0;
  List? toolBool;
  ActivePage(this.activIndex, {this.toolBool});
}


