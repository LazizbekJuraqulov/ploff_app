part of 'home_banner_bloc.dart';

@immutable
abstract class HomeBannerEvent {}

class HomeInit extends HomeBannerEvent {
  int? activIndex;
  List? toolBool;
  HomeInit({this.activIndex,this.toolBool});
}

class PageIndex extends HomeBannerEvent {
  int activIndex;
  PageIndex( this.activIndex);
}
class ActivePage extends HomeBannerEvent{
  int activIndex=0;
  List? toolBool;
  ActivePage(this.activIndex,{this.toolBool});
}
