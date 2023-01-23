part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {}

class NavbarInitial extends NavbarState {}

class Active extends NavbarState {
  int active;
  int activeIndex;
  bool isTrue;
  String name;
  String nomer;
  Active(this.active, this.activeIndex, this.isTrue,this.name,this.nomer);
}
