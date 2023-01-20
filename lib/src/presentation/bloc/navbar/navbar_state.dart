part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {
  
}

class NavbarInitial extends NavbarState {}

class Active extends NavbarState {
  int active;
  int activeIndex;
  Active(this.active, this.activeIndex);
}
