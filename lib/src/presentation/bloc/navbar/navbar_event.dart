part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}

class IntilPage extends NavbarEvent {}

class AfterPage extends NavbarEvent {
  int activeIndex;
  AfterPage(this.activeIndex);
}


