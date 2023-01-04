part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Phone extends RegisterState {
  TextEditingController text;
  TextEditingController nomer;
  TextEditingController code;
  Phone(this.text, this.nomer,this.code);
}
