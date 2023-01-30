part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {}

class NavbarInitial extends NavbarState {}

class Active extends NavbarState {
  
  int activeIndex;
  bool isTrue;
  String name;
  String nomer;
  Active( this.activeIndex, this.isTrue,this.name,this.nomer);
}
