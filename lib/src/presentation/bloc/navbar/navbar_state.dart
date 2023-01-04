part of 'navbar_bloc.dart';

@immutable
abstract class NavbarState {
  List page = [
    HomePage(), 
    BasketPage(), 
    MyOrdersPage(), 
    ProfilPage()];
}

class NavbarInitial extends NavbarState {}

class Active extends NavbarState {
  int active;
  int activeIndex;
  Active(this.active, this.activeIndex);
}
