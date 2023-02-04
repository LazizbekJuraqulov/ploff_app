part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Phone extends RegisterState {
  bool? isTrue;
  TextEditingController numberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Phone({this.isTrue});
}
