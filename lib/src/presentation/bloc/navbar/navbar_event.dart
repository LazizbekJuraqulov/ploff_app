part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}

class IntilPage extends NavbarEvent {}

class AfterPage extends NavbarEvent {
  int activeIndex;
  BuildContext context;
  AfterPage(this.activeIndex, this.context);
}

class Transfer extends NavbarEvent {}

class MyOrderTransferEvent extends NavbarEvent {}

class Transfer3Event extends NavbarEvent {}

class CloseTranferEvent extends NavbarEvent {
  bool isBool = true;
  CloseTranferEvent({required this.isBool});
}
