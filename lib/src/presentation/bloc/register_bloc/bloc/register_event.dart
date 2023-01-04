part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class InitalEvent extends RegisterEvent{}
class PhoneEvent extends RegisterEvent{}
class NameEvent extends RegisterEvent{}
class RegistrEvent extends RegisterEvent {}